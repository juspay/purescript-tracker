module Tracker where

import Prelude

import Effect (Effect)
import Effect.Class (liftEffect)
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
trackEventFlow a b = doAff $ liftEffect $ trackEvent a b
trackApiFlow :: Int -> Int  -> Int -> String -> String -> Flow Unit
trackApiFlow a b c d e = doAff $ liftEffect $ trackApi a b c d e
trackEventInfoFlow :: String -> String -> Flow Unit
trackEventInfoFlow a b = doAff $ liftEffect $ trackEventInfo a b
trackEventDebugFlow :: String -> String -> Flow Unit
trackEventDebugFlow a b = doAff $ liftEffect $ trackEventDebug a b
trackExceptionCriticalFlow :: String -> String -> String -> Flow Unit
trackExceptionCriticalFlow a b c = doAff $ liftEffect $ trackExceptionCritical a b c
trackExceptionWarningFlow :: String -> String -> String -> Flow Unit
trackExceptionWarningFlow a b c = doAff $ liftEffect $ trackExceptionWarning a b c
trackExceptionErrorFlow :: String -> String -> String -> Flow Unit
trackExceptionErrorFlow a b c = doAff $ liftEffect $ trackExceptionError a b c
trackMicroAppVerisonFlow :: String -> Flow Unit
trackMicroAppVerisonFlow a = doAff $ liftEffect $ trackMicroAppVerison a
trackScreenFlow :: String -> Flow Unit
trackScreenFlow a = doAff $ liftEffect $ trackScreen a
trackOverlayFlow :: String -> Flow Unit
trackOverlayFlow a = doAff $ liftEffect $ trackOverlay a
trackUserErrorFlow :: String -> Flow Unit
trackUserErrorFlow a = doAff $ liftEffect $ trackUserError a
trackPageLoadFlow :: String -> Int -> Int -> Int -> Flow Unit
trackPageLoadFlow a b c d = doAff $ liftEffect $ trackPageLoad a b c d

main :: Effect Unit
main = pure unit
