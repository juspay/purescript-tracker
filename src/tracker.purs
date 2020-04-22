module Tracker where

import Prelude (Unit, pure, show, unit, ($))

import Effect (Effect)
import Effect.Class (liftEffect)
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
foreign import _trackLifeCycle :: String -> String -> String -> String -> String -> Effect Unit
foreign import _trackAction    :: String -> String -> String -> String -> String -> Effect Unit
foreign import _trackApiCall   :: String -> String -> String -> Int -> Int -> String -> String  -> Effect Unit
foreign import _trackException :: String -> String -> String -> String -> String -> Effect Unit
foreign import _trackScreenWithLabel :: String -> String -> String -> String -> Effect Unit
-- foreign import trackMerchantContext :: Subcategory -> Level -> String -> MerchantContextValue -> Effect Unit
-- foreign import trackHypersdkContext :: Subcategory -> Level -> String -> HypersdkContextValue -> Effect Unit
-- foreign import trackPaymentContext  :: Subcategory -> Level -> String -> PaymentContextValue -> Effect Unit
-- foreign import trackUserContext     :: Subcategory -> Level -> String -> UserContextValue -> Effect Unit

-- Interfaces for Effect

trackLifeCycle :: Subcategory -> Level -> String -> String -> String -> Effect Unit
trackLifeCycle sub level label data' type' = _trackLifeCycle (show sub) (show level) label data' type'

trackAction    :: Subcategory -> Level -> String -> String -> String -> Effect Unit
trackAction sub level label data' type' = _trackAction (show sub) (show level) label data' type'

trackApiCall   :: Subcategory -> Level -> String -> Int -> Int -> String -> String  -> Effect Unit
trackApiCall sub level label startTime endTime response payload = _trackApiCall (show sub) (show level) label startTime endTime response payload

trackException :: Subcategory -> Level -> String -> String -> String -> Effect Unit
trackException sub level label msg stacktrace = _trackException (show sub) (show level) label msg stacktrace

trackScreenWithLabel :: Subcategory -> Level -> String -> String -> Effect Unit
trackScreenWithLabel sub level label presentation_type = _trackScreenWithLabel (show sub) (show level) label presentation_type

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

trackLifeCycleFlow :: Subcategory -> Level -> String -> String -> String -> Flow Unit
trackLifeCycleFlow sub level label data' type' = doAff $ liftEffect $ _trackLifeCycle (show sub) (show level) label data' type'

trackActionFlow    :: Subcategory -> Level -> String -> String -> String -> Flow Unit
trackActionFlow sub level label data' type' = doAff $ liftEffect $ _trackAction (show sub) (show level) label data' type'

trackApiCallFlow   :: Subcategory -> Level -> String -> Int -> Int -> String -> String  -> Flow Unit
trackApiCallFlow sub level label startTime endTime response payload = doAff $ liftEffect $ _trackApiCall (show sub) (show level) label startTime endTime response payload

trackExceptionFlow :: Subcategory -> Level -> String -> String -> String -> Flow Unit
trackExceptionFlow sub level label msg stacktrace = doAff $ liftEffect $ _trackException (show sub) (show level) label msg stacktrace

trackScreenWithLabelFlow :: Subcategory -> Level -> String -> String -> Flow Unit
trackScreenWithLabelFlow sub level label presentation_type = doAff $ liftEffect $ _trackScreenWithLabel (show sub) (show level) label presentation_type
-- trackMerchantContextFlow :: Subcategory -> Level -> String -> MerchantContextValue -> Flow Unit
-- trackMerchantContextFlow subcategory level label value= doAff $ liftEffect $ trackMerchantContext subcategory level label value
-- trackHypersdkContextFlow :: Subcategory -> Level -> String -> HypersdkContextValue -> Flow Unit
-- trackHypersdkContextFlow subcategory level label value = doAff $ liftEffect $ trackHypersdkContext subcategory level label value
-- trackPaymentContextFlow  :: Subcategory -> Level -> String -> PaymentContextValue -> Flow Unit
-- trackPaymentContextFlow subcategory level label value = doAff $ liftEffect $ trackPaymentContext subcategory level label value
-- trackUserContextFlow    :: Subcategory -> Level -> String -> UserContextValue -> Flow Unit
-- trackUserContextFlow subcategory level label value = doAff $ liftEffect $ trackUserContext subcategory level label value

main :: Effect Unit
main = pure unit
