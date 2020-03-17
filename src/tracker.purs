module Tracker where

import Prelude
import Effect (Effect)

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

main :: Effect Unit
main = pure unit
