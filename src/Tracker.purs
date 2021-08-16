module Tracker
  ( trackLifeCycle, trackLifeCycleFlow
  , trackAction, trackActionFlow
  , trackApiCall, trackApiCallFlow
  , trackException, trackExceptionFlow
  , trackScreen, trackScreenFlow
  , trackScreenPrev, trackScreenPrevFlow
  , trackContext, trackContextFlow
  , trackActionEvent, trackActionEventFlow
  , trackActionObject, trackActionObjectFlow
  , trackContextEvent, trackContextEventFlow
  , trackLifeCycleEvent, trackLifeCycleEventFlow
  , trackExceptionEvent , trackExceptionEventFlow
  , trackScreenEvent, trackScreenEventFlow
  , trackInitiateStart, trackInitiateEnd
  , trackProcessStart, trackProcessEnd
  , trackLoaderShow, trackLoaderHide
  , maskCvv, maskVpa, maskCardNumber, mask
  , trackInitiateStartV2, trackInitiateEndV2
  , trackProcessStartV2, trackProcessEndV2
  , trackLoaderShowFlow , trackLoaderHideFlow
  ) where

import Prelude

import Data.Array (last, length) as A
import Data.Foldable (foldl)
import Data.Maybe (fromMaybe)
import Data.String (length, split, take, Pattern(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Foreign.Class (encode)
import Foreign.Object as Object
import Presto.Core.Types.Language.Flow (Flow, doAff, getLogFields)
import Tracker.Labels (Label(..))
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
trackLifeCycle :: Lifecycle -> Level -> Label -> String -> Foreign -> Object.Object Foreign -> Effect Unit
trackLifeCycle sub level label key value json = _trackLifeCycle (show sub) (show level) (show label) (getValue key value) json

-- | trackAction [Category: Action], args:  subcategory, level, label, key, value
trackAction :: Action -> Level -> Label -> String -> Foreign -> Object.Object Foreign -> Effect Unit
trackAction sub level label key value json= _trackAction (show sub) (show level) (show label) (getValue key value) json

trackActionObject :: Action -> Level -> Label -> Object.Object Foreign -> Object.Object Foreign -> Effect Unit
trackActionObject sub level label value json= _trackAction (show sub) (show level) (show label) (encode value) json

-- | trackApiCall [Category: Api_call]
-- | args:  subcategory, level, label, start_time, end_time, status_code, response, url, payload, method
trackApiCall :: ApiCall -> Level -> Label -> Int -> Int -> Int -> String -> String -> String -> String -> Object.Object Foreign -> Effect Unit
trackApiCall sub level label start_time end_time status_code response url payload method json = _trackApiCall (show sub) (show level) (show label) start_time end_time status_code response url payload method json

-- | trackException, args: category, subcategory, label, message, stacktrace
trackException :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> Object.Object Foreign -> Effect Unit
trackException category sub label message stacktrace json = _trackException (showCategory category sub) (show sub) (show label) message stacktrace json

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name
trackScreen :: Screen -> Level -> Label -> String -> String -> Object.Object Foreign -> Effect Unit
trackScreen sub level label presentation_type name json = _trackScreenWithLabel (show sub) (show level) (show label) presentation_type name json

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name, old_screen
trackScreenPrev :: Screen -> Level -> Label -> String -> String -> String -> Object.Object Foreign -> Effect Unit
trackScreenPrev sub level label presentation_type name old_screen json = _trackScreenWithPrev (show sub) (show level) (show label) presentation_type name old_screen json

-- | trackContext [Category: Context], args: subcategory, level, label, value
trackContext :: Context -> Level -> Label -> Foreign -> Object.Object Foreign -> Effect Unit
trackContext sub level label value json = _trackContext (show sub) (show level) (show label) value json

-- | trackInitiateStart, args: level, value
trackInitiateStart :: Level -> Foreign -> Object.Object Foreign -> Effect Unit
trackInitiateStart level val json = trackLifeCycle Microapp level INITIATE "started" val json

-- | trackInitiateEnd, args: level, value
trackInitiateEnd :: Level -> Foreign -> Object.Object Foreign -> Effect Unit
trackInitiateEnd level val json = trackLifeCycle Microapp level INITIATE "ended" val json

-- | trackProcessStart, args: level, value
trackProcessStart :: Level -> Foreign -> Object.Object Foreign -> Effect Unit
trackProcessStart level val json = trackLifeCycle Microapp level PROCESS "started" val json

-- | trackProcessEnd, args: level, value
trackProcessEnd :: Level -> Foreign -> Object.Object Foreign -> Effect Unit
trackProcessEnd level val json = trackLifeCycle Microapp level PROCESS "ended" val json

trackInitiateStartV2 :: Level -> Foreign -> Flow Unit
trackInitiateStartV2 level val = trackLifeCycleFlow Microapp level INITIATE "started" val

-- | trackInitiateEnd, args: level, value
trackInitiateEndV2 :: Level -> Foreign -> Flow Unit
trackInitiateEndV2 level val = trackLifeCycleFlow Microapp level INITIATE "ended" val

-- | trackProcessStart, args: level, value
trackProcessStartV2 :: Level -> Foreign -> Flow Unit
trackProcessStartV2 level val = trackLifeCycleFlow Microapp level PROCESS "started" val

-- | trackProcessEnd, args: level, value
trackProcessEndV2 :: Level -> Foreign -> Flow Unit
trackProcessEndV2 level val = trackLifeCycleFlow Microapp level PROCESS "ended" val

trackLoaderShow :: Foreign -> Object.Object Foreign -> Effect Unit
trackLoaderShow value json = _trackAction (show (System)) (show Info) (show LOADER) (addKeyValue value "loader" "show") json

trackLoaderHide :: Foreign -> Object.Object Foreign -> Effect Unit
trackLoaderHide value json = _trackAction (show (System)) (show Info) (show LOADER) (addKeyValue value "loader" "hide") json

trackLoaderShowFlow :: Foreign -> Flow Unit
trackLoaderShowFlow value = do
    json <- getLogFields
    effectToFlow $ trackLoaderShow value json

trackLoaderHideFlow :: Foreign -> Flow Unit
trackLoaderHideFlow value = do
    json <- getLogFields
    effectToFlow $ trackLoaderHide value json


-- Interfaces for Flow
-- | Take same args as their Effect interface

trackLifeCycleFlow :: Lifecycle -> Level -> Label -> String -> Foreign -> Flow Unit
trackLifeCycleFlow sub level label key val = do
    json <- getLogFields
    effectToFlow $ trackLifeCycle sub level label key val json

trackActionFlow    :: Action -> Level -> Label -> String -> Foreign -> Flow Unit
trackActionFlow sub level label key val = do
    json <- getLogFields
    effectToFlow $ trackAction sub level label key val json

trackActionObjectFlow :: Action -> Level -> Label -> Object.Object Foreign -> Flow Unit
trackActionObjectFlow sub level label val = do
    json <- getLogFields
    effectToFlow $ trackActionObject sub level label val json

trackApiCallFlow :: ApiCall -> Level -> Label -> Int -> Int -> Int -> String -> String -> String -> String -> Flow Unit
trackApiCallFlow sub level label startTime endTime statusC response url payload val = do
    json <- getLogFields
    effectToFlow $ trackApiCall sub level label startTime endTime statusC response url payload val json

trackExceptionFlow :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> Flow Unit
trackExceptionFlow category sub label msg val = do
    json <- getLogFields
    effectToFlow $ trackException category sub label msg val json

trackScreenFlow :: Screen -> Level -> Label -> String -> String -> Flow Unit
trackScreenFlow sub level label pt val = do
    json <- getLogFields
    effectToFlow $ trackScreen sub level label pt val json

trackScreenPrevFlow :: Screen -> Level -> Label -> String -> String -> String -> Flow Unit
trackScreenPrevFlow sub level label presentation_type name old_screen = do
    json <- getLogFields
    effectToFlow $ trackScreenPrev sub level label presentation_type name old_screen json

trackContextFlow :: Context -> Level -> Label -> Foreign -> Flow Unit
trackContextFlow sub level label val = do
    json <- getLogFields
    effectToFlow $ trackContext sub level label val json

-- Functions for Old Format Logs

-- | trackLifeCycleEvent args:  subcategory, level, label, key, value, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Lifecycle], subcategory, level, label, key, value
trackLifeCycleEvent :: Lifecycle -> Level -> Label -> String -> Foreign -> String -> String -> Object.Object Foreign -> Effect Unit
trackLifeCycleEvent sub level label key value oldLabel oldValue json = _trackLifeCycleEvent (show sub) (show level) (show label) (getValue key value) oldLabel oldValue json

trackLifeCycleEventFlow :: Lifecycle -> Level -> Label -> String -> Foreign -> String -> String -> Flow Unit
trackLifeCycleEventFlow sub level label key value oldLabel oldValue = do
    json <- getLogFields
    effectToFlow $ trackLifeCycleEvent sub level label key value oldLabel oldValue json

-- | trackActionEvent args:  subcategory, level, label, key, value, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Action], subcategory, level, label, key, value

trackActionEvent :: Action -> Level -> Label -> String -> Foreign -> String -> String -> Object.Object Foreign -> Effect Unit
trackActionEvent sub level label key value oldLabel oldValue json = _trackActionEvent (show sub) (show level) (show label) (getValue key value) oldLabel oldValue json

trackActionEventFlow ::  Action -> Level -> Label -> String -> Foreign -> String -> String -> Flow Unit
trackActionEventFlow sub level label key value oldLabel oldValue = do
    json <- getLogFields 
    effectToFlow $ trackActionEvent sub level label key value oldLabel oldValue json

-- | trackContextEvent args: subcategory, level, label, value, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Context], subcategory, level, label, value

trackContextEvent :: Context -> Level -> Label -> Foreign -> String -> String -> Object.Object Foreign -> Effect Unit
trackContextEvent sub level label value oldLabel oldValue json = _trackContextEvent (show sub) (show level) (show label) value oldLabel oldValue json

trackContextEventFlow :: Context -> Level -> Label -> Foreign -> String -> String -> Flow Unit
trackContextEventFlow sub level label value oldLabel oldValue = do
    json <- getLogFields
    effectToFlow $ trackContextEvent sub level label value oldLabel oldValue json

-- | trackScreen [Category: Screen], args: subcategory, level, label, presentation_type, name, oldLabel, oldValue
-- | Old Format: [Type: Event], label: OldLabel, value: OldValue
-- | New Format: [Category: Screen], subcategory, level, label, presentation_type, name
trackScreenEvent :: Screen -> Level -> Label -> String -> String -> String -> String -> Object.Object Foreign -> Effect Unit
trackScreenEvent sub level label presentation_type name oldLabel oldValue json = _trackScreenEvent (show sub) (show level) (show label) presentation_type name oldLabel oldValue json

trackScreenEventFlow :: Screen -> Level -> Label -> String -> String -> String -> String -> Flow Unit
trackScreenEventFlow sub level label presentation_type name oldLabel oldValue = do
    json <- getLogFields
    effectToFlow $ trackScreenEvent sub level label presentation_type name oldLabel oldValue json

-- | trackExceptionEvent args:  category, subcategory, label, message, stacktrace, oldLabel
-- | Old Format: [Type: Event], label: OldLabel, message, stacktrace
-- | New Format: category, subcategory, label, message, stacktrace
trackExceptionEvent :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> String -> Object.Object Foreign -> Effect Unit
trackExceptionEvent category sub label message stacktrace oldLabel json = _trackExceptionEvent (showCategory category sub) (show sub) (show label) message stacktrace oldLabel json

trackExceptionEventFlow :: forall a b. Show b => T.Category a b => a -> b -> Label -> String -> String -> String -> Flow Unit
trackExceptionEventFlow category sub label msg st oldLabel = do
    json <- getLogFields
    effectToFlow $ trackExceptionEvent category sub label msg st oldLabel json

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
