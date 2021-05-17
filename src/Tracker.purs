module Tracker
  ( trackLifeCycle, trackLifeCycleFlow
  , trackAction, trackActionFlow
  , trackApiCall, trackApiCallFlow
  , trackException, trackExceptionFlow
  , trackScreen, trackScreenFlow
  , trackScreenPrev
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
import Foreign.Object (empty)
import Foreign.Object as Object
import Prelude
import Presto.Core.Types.Language.Flow (Flow, doAff, getLogFields)
import Tracker.Labels (Label (..))
import Tracker.Types (Action(..), ApiCall, Context, Level(..), Lifecycle(..), Screen, showCategory)
import Tracker.Types (class Category) as T

foreign import getValue :: String -> Foreign -> Foreign
foreign import addKeyValue :: Foreign -> String -> String -> Foreign
foreign import _trackLifeCycle :: String -> String -> String -> Foreign -> Object.Object Foreign -> Effect Unit
foreign import _trackAction    :: String -> String -> String -> Foreign -> Object.Object Foreign -> Effect Unit
foreign import _trackApiCall   :: String -> String -> String -> Int -> Int -> Int -> String -> String -> String -> String -> Object.Object Foreign -> Effect Unit
foreign import _trackException :: String -> String -> String -> String -> String -> Object.Object Foreign -> Effect Unit
foreign import _trackScreenWithLabel :: String -> String -> String -> String -> String -> Object.Object Foreign -> Effect Unit
foreign import _trackScreenWithPrev :: String -> String -> String -> String -> String -> String -> Object.Object Foreign -> Effect Unit
foreign import _trackContext   :: String -> String -> String -> Foreign -> Object.Object Foreign -> Effect Unit
foreign import _trackActionEvent  :: String -> String -> String -> Foreign -> String -> String -> Object.Object Foreign -> Effect Unit
foreign import _trackContextEvent :: String -> String -> String -> Foreign -> String -> String -> Object.Object Foreign -> Effect Unit
foreign import _trackScreenEvent :: String -> String -> String -> String -> String -> String -> String -> Object.Object Foreign -> Effect Unit
foreign import _trackLifeCycleEvent :: String -> String -> String -> Foreign -> String -> String -> Object.Object Foreign -> Effect Unit
foreign import _trackExceptionEvent :: String -> String -> String -> String -> String -> String -> Object.Object Foreign -> Effect Unit

-- Interfaces for Effect

-- | trackLifeCycle [Category: Lifecycle], args: subcategory, level, label, key, value
trackLifeCycle :: Lifecycle -> Level -> Label -> String -> Foreign -> Effect Unit
trackLifeCycle sub level label key value = _trackLifeCycle (show sub) (show level) (show label) (getValue key value) empty

-- | trackAction [Category: Action], args:  subcategory, level, label, key, value
trackAction :: Action -> Level -> Label -> String -> Foreign -> Effect Unit
trackAction sub level label key value = _trackAction (show sub) (show level) (show label) (getValue key value) empty

-- | trackApiCall [Category: Api_call]
-- | args:  subcategory, level, label, start_time, end_time, status_code, response, url, payload, method
trackApiCall :: ApiCall -> Level -> Label -> Int -> Int -> Int -> String -> String -> String -> String -> Effect Unit
trackApiCall sub level label start_time end_time status_code response url payload method = _trackApiCall (show sub) (show level) (show label) start_time end_time status_code response url payload method empty

-- | trackException, args: category, subcategory, label, message, stacktrace
trackException :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> Effect Unit
trackException category sub label message stacktrace = _trackException (showCategory category sub) (show sub) (show label) message stacktrace empty

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name
trackScreen :: Screen -> Level -> Label -> String -> String -> Effect Unit
trackScreen sub level label presentation_type name = _trackScreenWithLabel (show sub) (show level) (show label) presentation_type name empty

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name, old_screen
trackScreenPrev :: Screen -> Level -> Label -> String -> String -> String ->Effect Unit
trackScreenPrev sub level label presentation_type name old_screen = _trackScreenWithPrev (show sub) (show level) (show label) presentation_type name old_screen empty

-- | trackContext [Category: Context], args: subcategory, level, label, value
trackContext :: Context -> Level -> Label -> Foreign -> Effect Unit
trackContext sub level label value = _trackContext (show sub) (show level) (show label) value empty

-- | trackInitiateStart, args: level, value
trackInitiateStart :: Level -> Foreign -> Effect Unit
trackInitiateStart level = trackLifeCycle Microapp level INITIATE "started"

-- | trackInitiateEnd, args: level, value
trackInitiateEnd :: Level -> Foreign -> Effect Unit
trackInitiateEnd level = trackLifeCycle Microapp level INITIATE "ended"

-- | trackProcessStart, args: level, value
trackProcessStart :: Level -> Foreign -> Effect Unit
trackProcessStart level = trackLifeCycle Microapp level PROCESS "started"

-- | trackProcessEnd, args: level, value
trackProcessEnd :: Level -> Foreign -> Effect Unit
trackProcessEnd level = trackLifeCycle Microapp level PROCESS "ended"

trackLoaderShow :: Foreign -> Effect Unit
trackLoaderShow value = _trackAction (show (System)) (show Info) (show LOADER) (addKeyValue value "loader" "show") empty

trackLoaderHide :: Foreign -> Effect Unit
trackLoaderHide value = _trackAction (show (System)) (show Info) (show LOADER) (addKeyValue value "loader" "hide") empty

-- Functions for New Format Logs with an additional parameter
-- To log request id and order id in  log level
-- | trackLifeCycle [Category: Lifecycle], args: subcategory, level, label, key, value
trackLifeCycleWithJson :: Lifecycle -> Level -> Label -> String -> Foreign -> Object.Object Foreign -> Effect Unit
trackLifeCycleWithJson sub level label key value json = _trackLifeCycle (show sub) (show level) (show label) (getValue key value) json

-- | trackAction [Category: Action], args:  subcategory, level, label, key, value
trackActionWithJson :: Action -> Level -> Label -> String -> Foreign -> Object.Object Foreign -> Effect Unit
trackActionWithJson sub level label key value json= _trackAction (show sub) (show level) (show label) (getValue key value) json

-- | trackApiCall [Category: Api_call]
-- | args:  subcategory, level, label, start_time, end_time, status_code, response, url, payload, method
trackApiCallWithJson :: ApiCall -> Level -> Label -> Int -> Int -> Int -> String -> String -> String -> String -> Object.Object Foreign -> Effect Unit
trackApiCallWithJson sub level label start_time end_time status_code response url payload method json = _trackApiCall (show sub) (show level) (show label) start_time end_time status_code response url payload method json

-- | trackException, args: category, subcategory, label, message, stacktrace
trackExceptionWithJson :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> Object.Object Foreign -> Effect Unit
trackExceptionWithJson category sub label message stacktrace json = _trackException (showCategory category sub) (show sub) (show label) message stacktrace json

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name
trackScreenWithJson :: Screen -> Level -> Label -> String -> String -> Object.Object Foreign -> Effect Unit
trackScreenWithJson sub level label presentation_type name json = _trackScreenWithLabel (show sub) (show level) (show label) presentation_type name json

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name, old_screen
trackScreenPrevWithJson :: Screen -> Level -> Label -> String -> String -> String -> Object.Object Foreign -> Effect Unit
trackScreenPrevWithJson sub level label presentation_type name old_screen json = _trackScreenWithPrev (show sub) (show level) (show label) presentation_type name old_screen json

-- | trackContext [Category: Context], args: subcategory, level, label, value
trackContextWithJson :: Context -> Level -> Label -> Foreign -> Object.Object Foreign -> Effect Unit
trackContextWithJson sub level label value json = _trackContext (show sub) (show level) (show label) value json

-- Interfaces for Flow
-- | Take same args as their Effect interface

trackLifeCycleFlow :: Lifecycle -> Level -> Label -> String -> Foreign -> Flow Unit
trackLifeCycleFlow sub level label key val = do
    json <- getLogFields
    effectToFlow $ trackLifeCycleWithJson sub level label key val json

trackActionFlow    :: Action -> Level -> Label -> String -> Foreign -> Flow Unit
trackActionFlow sub level label key val = do
    json <- getLogFields
    effectToFlow $ trackActionWithJson sub level label key val json

trackApiCallFlow :: ApiCall -> Level -> Label -> Int -> Int -> Int -> String -> String -> String -> String -> Flow Unit
trackApiCallFlow sub level label startTime endTime statusC response url payload val = do
    json <- getLogFields
    effectToFlow $ trackApiCallWithJson sub level label startTime endTime statusC response url payload val json

trackExceptionFlow :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> Flow Unit
trackExceptionFlow category sub label msg val = do
    json <- getLogFields
    effectToFlow $ trackExceptionWithJson category sub label msg val json

trackScreenFlow :: Screen -> Level -> Label -> String -> String -> Flow Unit
trackScreenFlow sub level label pt val = do
    json <- getLogFields
    effectToFlow $ trackScreenWithJson sub level label pt val json

trackContextFlow :: Context -> Level -> Label -> Foreign -> Flow Unit
trackContextFlow sub level label val = do
    json <- getLogFields
    effectToFlow $ trackContextWithJson sub level label val json

-- Functions for Old Format Logs

-- | trackLifeCycleEvent args:  subcategory, level, label, key, value, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Lifecycle], subcategory, level, label, key, value
trackLifeCycleEvent :: Lifecycle -> Level -> Label -> String -> Foreign -> String -> String -> Effect Unit
trackLifeCycleEvent sub level label key value oldLabel oldValue = _trackLifeCycleEvent (show sub) (show level) (show label) (getValue key value) oldLabel oldValue empty

trackLifeCycleEventWithJson :: Lifecycle -> Level -> Label -> String -> Foreign -> String -> String -> Object.Object Foreign -> Effect Unit
trackLifeCycleEventWithJson sub level label key value oldLabel oldValue json = _trackLifeCycleEvent (show sub) (show level) (show label) (getValue key value) oldLabel oldValue json

trackLifeCycleEventFlow :: Lifecycle -> Level -> Label -> String -> Foreign -> String -> String -> Flow Unit
trackLifeCycleEventFlow sub level label key value oldLabel oldValue = do
    json <- getLogFields
    effectToFlow $ trackLifeCycleEventWithJson sub level label key value oldLabel oldValue json

-- | trackActionEvent args:  subcategory, level, label, key, value, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Action], subcategory, level, label, key, value
trackActionEvent :: Action -> Level -> Label -> String -> Foreign -> String -> String -> Effect Unit
trackActionEvent sub level label key value oldLabel oldValue = _trackActionEvent (show sub) (show level) (show label) (getValue key value) oldLabel oldValue empty

trackActionEventWithJson :: Action -> Level -> Label -> String -> Foreign -> String -> String -> Object.Object Foreign -> Effect Unit
trackActionEventWithJson sub level label key value oldLabel oldValue json = _trackActionEvent (show sub) (show level) (show label) (getValue key value) oldLabel oldValue json

trackActionEventFlow ::  Action -> Level -> Label -> String -> Foreign -> String -> String -> Flow Unit
trackActionEventFlow sub level label key value oldLabel oldValue = do
    json <- getLogFields 
    effectToFlow $ trackActionEventWithJson sub level label key value oldLabel oldValue json

-- | trackContextEvent args: subcategory, level, label, value, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Context], subcategory, level, label, value
trackContextEvent :: Context -> Level -> Label -> Foreign -> String -> String -> Effect Unit
trackContextEvent sub level label value oldLabel oldValue = _trackContextEvent (show sub) (show level) (show label) value oldLabel oldValue empty

trackContextEventWithJson :: Context -> Level -> Label -> Foreign -> String -> String -> Object.Object Foreign -> Effect Unit
trackContextEventWithJson sub level label value oldLabel oldValue json = _trackContextEvent (show sub) (show level) (show label) value oldLabel oldValue json

trackContextEventFlow :: Context -> Level -> Label -> Foreign -> String -> String -> Flow Unit
trackContextEventFlow sub level label value oldLabel oldValue = do
    json <- getLogFields
    effectToFlow $ trackContextEventWithJson sub level label value oldLabel oldValue json

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Screen], subcategory, level, label, presentation_type, name
trackScreenEvent :: Screen -> Level -> Label -> String -> String -> String -> String -> Effect Unit
trackScreenEvent sub level label presentation_type name oldLabel oldValue = _trackScreenEvent (show sub) (show level) (show label) presentation_type name oldLabel oldValue empty

-- | trackExceptionEvent args:  category, subcategory, label, message, stacktrace, oldLabel
-- | Old Format: [Type: Event], label: OldLabel, message, stacktrace
-- | New Format: category, subcategory, label, message, stacktrace
trackExceptionEvent :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> String -> Effect Unit
trackExceptionEvent category sub label message stacktrace oldLabel = _trackExceptionEvent (showCategory category sub) (show sub) (show label) message stacktrace oldLabel empty

trackExceptionEventWithJson :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> String -> Object.Object Foreign -> Effect Unit
trackExceptionEventWithJson category sub label message stacktrace oldLabel json = _trackExceptionEvent (showCategory category sub) (show sub) (show label) message stacktrace oldLabel json

trackExceptionEventFlow :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> String -> Flow Unit
trackExceptionEventFlow category sub label msg st oldLabel = do
    json <- getLogFields
    effectToFlow $ trackExceptionEventWithJson category sub label msg st oldLabel json

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
getMask len =
    if len <= 0
        then ""
        else "X" <> (getMask $ len - 1)

main :: Effect Unit
main = pure unit
