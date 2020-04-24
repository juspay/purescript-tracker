module Tracker
  ( trackLifeCycle, trackLifeCycleFlow
  , trackAction, trackActionFlow
  , trackApiCall, trackApiCallFlow
  , trackException, trackExceptionFlow
  , trackScreenWithLabel, trackScreenWithLabelFlow
  , trackContext, trackContextFlow
  , trackEvent, trackEventFlow
  , trackApi, trackApiFlow
  , trackEventInfo, trackEventInfoFlow
  , trackEventDebug, trackEventDebugFlow
  , trackExceptionCritical, trackExceptionCriticalFlow
  , trackExceptionWarning, trackExceptionWarningFlow
  , trackExceptionError, trackExceptionErrorFlow
  , trackMicroAppVerison, trackMicroAppVerisonFlow
  , trackScreen, trackScreenFlow
  , trackOverlay, trackOverlayFlow
  , trackUserError, trackUserErrorFlow
  , trackPageLoad, trackPageLoadFlow
  ) where

import Effect (Effect)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Labels (Label)
import Prelude (Unit, pure, show, unit, ($))
import Presto.Core.Types.Language.Flow (Flow, doAff)
import Types (Level, Subcategory)

foreign import trackEvent :: String -> String -> Effect Unit
foreign import trackApi :: Int -> Int  -> Int -> String -> String -> String -> Effect Unit
foreign import trackEventInfo :: String -> String -> Effect Unit
foreign import trackEventDebug :: String -> String -> Effect Unit
foreign import trackExceptionCritical :: String -> String -> String -> Effect Unit
foreign import trackExceptionWarning :: String -> String -> String -> Effect Unit
foreign import trackExceptionError :: String -> String -> String -> Effect Unit
foreign import trackMicroAppVerison :: String -> Effect Unit
foreign import trackScreen :: String -> Effect Unit
foreign import trackOverlay :: String -> Effect Unit
foreign import trackUserError :: String -> Effect Unit
foreign import trackPageLoad :: String -> Int -> Int -> Int -> Effect Unit
foreign import _trackLifeCycle :: String -> String -> String -> Foreign -> Effect Unit
foreign import _trackAction    :: String -> String -> String -> Foreign -> Effect Unit
foreign import _trackApiCall   :: String -> String -> String -> Int -> Int -> String -> String  -> Effect Unit
foreign import _trackException :: String -> String -> String -> String -> String -> Effect Unit
foreign import _trackScreenWithLabel :: String -> String -> String -> String -> Effect Unit
foreign import _trackContext   :: String -> String -> String -> Foreign -> Effect Unit

-- Interfaces for Effect

trackLifeCycle :: Subcategory -> Level -> Label -> Foreign -> Effect Unit
trackLifeCycle sub level label value = _trackLifeCycle (show sub) (show level) (show label) value

trackAction :: Subcategory -> Level -> Label -> Foreign -> Effect Unit
trackAction sub level label value = _trackAction (show sub) (show level) (show label) value

trackApiCall :: Subcategory -> Level -> Label -> Int -> Int -> String -> String  -> Effect Unit
trackApiCall sub level label startTime endTime response payload = _trackApiCall (show sub) (show level) (show label) startTime endTime response payload

trackException :: Subcategory -> Level -> Label -> String -> String -> Effect Unit
trackException sub level label msg stacktrace = _trackException (show sub) (show level) (show label) msg stacktrace

trackScreenWithLabel :: Subcategory -> Level -> Label -> String -> Effect Unit
trackScreenWithLabel sub level label presentation_type = _trackScreenWithLabel (show sub) (show level) (show label) presentation_type

trackContext :: Subcategory -> Level -> Label -> Foreign -> Effect Unit
trackContext sub level label value = _trackContext (show sub) (show level) (show label) value

-- Interfaces for Flow

trackEventFlow :: String -> String -> Flow Unit
trackEventFlow label value = doAff $ liftEffect $ trackEvent label value
trackApiFlow :: Int -> Int  -> Int -> String -> String -> String -> Flow Unit
trackApiFlow status start end url response payload = doAff $ liftEffect $ trackApi status start end url response payload
trackEventInfoFlow :: String -> String -> Flow Unit
trackEventInfoFlow label value = doAff $ liftEffect $ trackEventInfo label value
trackEventDebugFlow :: String -> String -> Flow Unit
trackEventDebugFlow label value = doAff $ liftEffect $ trackEventDebug label value
trackExceptionCriticalFlow :: String -> String -> String -> Flow Unit
trackExceptionCriticalFlow exception stacktrace message = doAff $ liftEffect $ trackExceptionCritical exception stacktrace message
trackExceptionWarningFlow :: String -> String -> String -> Flow Unit
trackExceptionWarningFlow exception stacktrace message = doAff $ liftEffect $ trackExceptionWarning exception stacktrace message
trackExceptionErrorFlow :: String -> String -> String -> Flow Unit
trackExceptionErrorFlow exception stacktrace message = doAff $ liftEffect $ trackExceptionError exception stacktrace message
trackMicroAppVerisonFlow :: String -> Flow Unit
trackMicroAppVerisonFlow version = doAff $ liftEffect $ trackMicroAppVerison version
trackScreenFlow :: String -> Flow Unit
trackScreenFlow name = doAff $ liftEffect $ trackScreen name
trackOverlayFlow :: String -> Flow Unit
trackOverlayFlow name = doAff $ liftEffect $ trackOverlay name
trackUserErrorFlow :: String -> Flow Unit
trackUserErrorFlow error = doAff $ liftEffect $ trackUserError error
trackPageLoadFlow :: String -> Int -> Int -> Int -> Flow Unit
trackPageLoadFlow url start_time end_time status_code = doAff $ liftEffect $ trackPageLoad url start_time end_time status_code

-- Category-wise Interfaces

trackLifeCycleFlow :: Subcategory -> Level -> Label -> Foreign -> Flow Unit
trackLifeCycleFlow sub level label value = doAff $ liftEffect $ _trackLifeCycle (show sub) (show level) (show label) value

trackActionFlow    :: Subcategory -> Level -> Label -> Foreign -> Flow Unit
trackActionFlow sub level label value = doAff $ liftEffect $ _trackAction (show sub) (show level) (show label) value

trackApiCallFlow   :: Subcategory -> Level -> Label -> Int -> Int -> String -> String  -> Flow Unit
trackApiCallFlow sub level label startTime endTime response payload = doAff $ liftEffect $ _trackApiCall (show sub) (show level) (show label) startTime endTime response payload

trackExceptionFlow :: Subcategory -> Level -> Label -> String -> String -> Flow Unit
trackExceptionFlow sub level label msg stacktrace = doAff $ liftEffect $ _trackException (show sub) (show level) (show label) msg stacktrace

trackScreenWithLabelFlow :: Subcategory -> Level -> Label -> String -> Flow Unit
trackScreenWithLabelFlow sub level label presentation_type = doAff $ liftEffect $ _trackScreenWithLabel (show sub) (show level) (show label) presentation_type

trackContextFlow :: Subcategory -> Level -> Label -> Foreign -> Flow Unit
trackContextFlow sub level label value = doAff $ liftEffect $ _trackContext (show sub) (show level) (show label) value

main :: Effect Unit
main = pure unit
