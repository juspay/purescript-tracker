module Tracker
  ( trackLifeCycle, trackLifeCycleFlow
  , trackAction, trackActionFlow
  , trackApiCall, trackApiCallFlow
  , trackException, trackExceptionFlow
  , trackScreen, trackScreenFlow
  , trackContext, trackContextFlow
  , trackActionEvent, trackActionEventFlow
  , trackContextEvent, trackContextEventFlow
  , trackLifeCycleEvent, trackLifeCycleEventFlow
  , trackExceptionEvent , trackExceptionEventFlow
  , trackScreenEvent
  , trackInitiateStart, trackInitiateEnd
  , trackProcessStart, trackProcessEnd
  , trackLoaderShow, trackLoaderHide
  , maskCvv, maskVpa, maskCardNumber, mask
  ) where

import Data.Array (last, length) as A
import Data.Foldable (foldl)
import Data.Maybe (fromMaybe)
import Data.String (length, split, take, Pattern(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Prelude
import Presto.Core.Types.Language.Flow (Flow, doAff)
import Tracker.Labels (Label (..))
import Tracker.Types (Action(..), ApiCall, Context, Level(..), Lifecycle, Screen, showCategory)
import Tracker.Types (class Category) as T

foreign import getValue :: String -> Foreign -> Foreign
foreign import addKeyValue :: Foreign -> String -> String -> Foreign
foreign import _trackLifeCycle :: String -> String -> String -> Foreign -> Effect Unit
foreign import _trackAction    :: String -> String -> String -> Foreign -> Effect Unit
foreign import _trackApiCall   :: String -> String -> String -> Int -> Int -> Int -> String -> String -> String -> String -> Effect Unit
foreign import _trackException :: String -> String -> String -> String -> String -> Effect Unit
foreign import _trackScreenWithLabel :: String -> String -> String -> String -> String -> Effect Unit
foreign import _trackContext   :: String -> String -> String -> Foreign -> Effect Unit
foreign import _trackActionEvent  :: String -> String -> String -> Foreign -> String -> String -> Effect Unit
foreign import _trackContextEvent :: String -> String -> String -> Foreign -> String -> String -> Effect Unit
foreign import _trackScreenEvent :: String -> String -> String -> String -> String -> String -> String -> Effect Unit
foreign import _trackLifeCycleEvent :: String -> String -> String -> Foreign -> String -> String -> Effect Unit
foreign import _trackExceptionEvent :: String -> String -> String -> String -> String -> String -> Effect Unit

-- Interfaces for Effect

-- | trackLifeCycle [Category: Lifecycle], args: subcategory, level, label, key, value
trackLifeCycle :: Lifecycle -> Level -> Label -> String -> Foreign -> Effect Unit
trackLifeCycle sub level label key value = _trackLifeCycle (show sub) (show level) (show label) (getValue key value)

-- | trackAction [Category: Action], args:  subcategory, level, label, key, value
trackAction :: Action -> Level -> Label -> String -> Foreign -> Effect Unit
trackAction sub level label key value = _trackAction (show sub) (show level) (show label) (getValue key value)

-- | trackApiCall [Category: Api_call]
-- | args:  subcategory, level, label, start_time, end_time, status_code, response, url, payload, method
trackApiCall :: ApiCall -> Level -> Label -> Int -> Int -> Int -> String -> String -> String -> String -> Effect Unit
trackApiCall sub level label = _trackApiCall (show sub) (show level) (show label)

-- | trackException, args: category, subcategory, label, message, stacktrace
trackException :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> Effect Unit
trackException category sub label = _trackException (showCategory category sub) (show sub) (show label)

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name
trackScreen :: Screen -> Level -> Label -> String -> String -> Effect Unit
trackScreen sub level label = _trackScreenWithLabel (show sub) (show level) (show label)

-- | trackContext [Category: Context], args: subcategory, level, label, value
trackContext :: Context -> Level -> Label -> Foreign -> Effect Unit
trackContext sub level label = _trackContext (show sub) (show level) (show label)

-- | trackInitiateStart, args: level, value
trackInitiateStart :: Level -> Foreign -> Effect Unit
trackInitiateStart level = trackAction User level INITIATE "started"

-- | trackInitiateEnd, args: level, value
trackInitiateEnd :: Level -> Foreign -> Effect Unit
trackInitiateEnd level = trackAction User level INITIATE "ended"

-- | trackProcessStart, args: level, value
trackProcessStart :: Level -> Foreign -> Effect Unit
trackProcessStart level = trackAction User level PROCESS "started"

-- | trackProcessEnd, args: level, value
trackProcessEnd :: Level -> Foreign -> Effect Unit
trackProcessEnd level = trackAction User level PROCESS "ended"

trackLoaderShow :: Foreign -> Effect Unit
trackLoaderShow value = _trackAction (show (System)) (show Info) (show LOADER) (addKeyValue value "loader" "show")

trackLoaderHide :: Foreign -> Effect Unit
trackLoaderHide value = _trackAction (show (System)) (show Info) (show LOADER) (addKeyValue value "loader" "hide")

-- Interfaces for Flow
-- | Take same args as their Effect interface

trackLifeCycleFlow :: Lifecycle -> Level -> Label -> String -> Foreign -> Flow Unit
trackLifeCycleFlow sub level label key = effectToFlow <<< trackLifeCycle sub level label key

trackActionFlow    :: Action -> Level -> Label -> String -> Foreign -> Flow Unit
trackActionFlow sub level label key = effectToFlow <<< trackAction sub level label key

trackApiCallFlow :: ApiCall -> Level -> Label -> Int -> Int -> Int -> String -> String -> String -> String -> Flow Unit
trackApiCallFlow sub level label startTime endTime statusC response url payload = effectToFlow <<< trackApiCall sub level label startTime endTime statusC response url payload

trackExceptionFlow :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> Flow Unit
trackExceptionFlow category sub label msg = effectToFlow <<< trackException category sub label msg

trackScreenFlow :: Screen -> Level -> Label -> String -> String -> Flow Unit
trackScreenFlow sub level label pt = effectToFlow <<< trackScreen sub level label pt

trackContextFlow :: Context -> Level -> Label -> Foreign -> Flow Unit
trackContextFlow sub level label = effectToFlow <<< trackContext sub level label

-- Functions for Old Format Logs

-- | trackLifeCycleEvent args:  subcategory, level, label, key, value, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Lifecycle], subcategory, level, label, key, value
trackLifeCycleEvent :: Lifecycle -> Level -> Label -> String -> Foreign -> String -> String -> Effect Unit
trackLifeCycleEvent sub level label key value = _trackLifeCycleEvent (show sub) (show level) (show label) (getValue key value)

trackLifeCycleEventFlow :: Lifecycle -> Level -> Label -> String -> Foreign -> String -> String -> Flow Unit
trackLifeCycleEventFlow sub level label key value oldLabel = effectToFlow <<< trackLifeCycleEvent sub level label key value oldLabel

-- | trackActionEvent args:  subcategory, level, label, key, value, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Action], subcategory, level, label, key, value
trackActionEvent :: Action -> Level -> Label -> String -> Foreign -> String -> String -> Effect Unit
trackActionEvent sub level label key value= _trackActionEvent (show sub) (show level) (show label) (getValue key value)

trackActionEventFlow ::  Action -> Level -> Label -> String -> Foreign -> String -> String -> Flow Unit
trackActionEventFlow sub level label key value oldLabel = effectToFlow <<< trackActionEvent sub level label key value oldLabel

-- | trackContextEvent args: subcategory, level, label, value, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Context], subcategory, level, label, value
trackContextEvent :: Context -> Level -> Label -> Foreign -> String -> String -> Effect Unit
trackContextEvent sub level label = _trackContextEvent (show sub) (show level) (show label)

trackContextEventFlow :: Context -> Level -> Label -> Foreign -> String -> String -> Flow Unit
trackContextEventFlow sub level label value oldLabel = effectToFlow <<< trackContextEvent sub level label value oldLabel

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Screen], subcategory, level, label, presentation_type, name
trackScreenEvent :: Screen -> Level -> Label -> String -> String -> String -> String -> Effect Unit
trackScreenEvent sub level label = _trackScreenEvent (show sub) (show level) (show label)

-- | trackExceptionEvent args:  category, subcategory, label, message, stacktrace, oldLabel
-- | Old Format: [Type: Event], label: OldLabel, message, stacktrace
-- | New Format: category, subcategory, label, message, stacktrace
trackExceptionEvent :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> String -> Effect Unit
trackExceptionEvent category sub label = _trackExceptionEvent (showCategory category sub) (show sub) (show label)

trackExceptionEventFlow :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> String -> Flow Unit
trackExceptionEventFlow category sub label msg st = effectToFlow <<< trackExceptionEvent category sub label msg st

-- Masking Functions

maskCardNumber :: String -> String
maskCardNumber cn = take 6 cn_ <> getMask (length cn_ - 6)
    where cn_ = foldl (<>) "" $ split (Pattern " ") cn

maskCvv :: String -> String
maskCvv = getMask <<< length

maskVpa :: String -> String
maskVpa vpa = let splitArr = split (Pattern "@") vpa
    in if (A.length splitArr) == 1
        then getMask $ length vpa
    else ("@" <> (fromMaybe "" $ A.last splitArr))

mask :: String -> String
mask = getMask <<< length

-- Util Functions

effectToFlow :: Effect Unit -> Flow Unit
effectToFlow = doAff <<< liftEffect

getMask :: Int -> String
getMask 0 = ""
getMask n = "X" <> getMask (n - 1)

main :: Effect Unit
main = pure unit
