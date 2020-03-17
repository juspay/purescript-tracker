module Tracker where

import Prelude

import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Exception (name)
import Presto.Core.Types.Language.Flow (Flow, doAff)

foreign import trackEvent :: String -> String -> Effect Unit
foreign import trackApi :: Int -> Int  -> Int -> String -> String-> Effect Unit
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

trackEventFlow :: String -> String -> Flow Unit
trackEventFlow label value = doAff $ liftEffect $ trackEvent label value
trackApiFlow :: Int -> Int  -> Int -> String -> String -> Flow Unit
trackApiFlow status start end url response = doAff $ liftEffect $ trackApi status start end url response
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

main :: Effect Unit
main = pure unit
