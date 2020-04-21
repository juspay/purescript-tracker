module Tracker where

import Prelude

import Effect (Effect)
import Effect.Class (liftEffect)
import Presto.Core.Types.Language.Flow (Flow, doAff)

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
foreign import trackLifeCycle :: Subcategory -> Level -> String -> String -> String -> Effect Unit
foreign import trackAction    :: Subcategory -> Level -> String -> String -> String -> Effect Unit
foreign import trackApiCall   :: Subcategory -> Level -> String -> Int -> Int -> String -> String  -> Effect Unit
foreign import trackException :: Subcategory -> Level -> String -> String -> String -> Effect Unit
foreign import trackScreenWithLabel :: Level -> String -> String -> Effect Unit
foreign import trackMerchantContext :: Subcategory -> Level -> String -> MerchantContextValue -> Effect Unit
foreign import trackHypersdkContext :: Subcategory -> Level -> String -> HypersdkContextValue -> Effect Unit
foreign import trackPaymentContext  :: Subcategory -> Level -> String -> PaymentContextValue -> Effect Unit
foreign import trackUserContext     :: Subcategory -> Level -> String -> UserContextValue -> Effect Unit

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
trackLifeCycleFlow :: Subcategory -> Level -> String -> String -> String -> Flow Unit
trackLifeCycleFlow sub level label data_ type_ = doAff $ liftEffect $ trackLifeCycle sub level label data_ type_
trackActionFlow    :: Subcategory -> Level -> String -> String -> String -> Flow Unit
trackActionFlow sub level label data_ type_ = doAff $ liftEffect $ trackAction sub level label data_ type_
trackApiCallFlow   :: Subcategory -> Level -> String -> Int -> Int -> String -> String  -> Flow Unit
trackApiCallFlow subcategory level label start_time end_time response payload = doAff $ liftEffect $ trackApiCall subcategory level service label start_time end_time response payload
trackExceptionFlow :: Subcategory -> Level -> String -> String -> String -> Flow Unit
trackExceptionFlow subcategory level label message stacktrace = doAff $ liftEffect $ trackException subcategory level service label message stacktrace
trackScreenWithLabelFlow :: Level -> String -> String -> Flow Unit
trackScreenWithLabelFlow level label presentation_type = doAff $ liftEffect $ trackScreenWithLabel level label presentation_type
trackMerchantContextFlow :: Subcategory -> Level -> String -> MerchantContextValue -> Flow Unit
trackMerchantContextFlow subcategory level label value= doAff $ liftEffect $ trackMerchantContext subcategory level label value
trackHypersdkContextFlow :: Subcategory -> Level -> String -> HypersdkContextValue -> Flow Unit
trackHypersdkContextFlow subcategory level label value = doAff $ liftEffect $ trackHypersdkContext subcategory level label value
trackPaymentContextFlow  :: Subcategory -> Level -> String -> PaymentContextValue -> Flow Unit
trackPaymentContextFlow subcategory level label value = doAff $ liftEffect $ trackPaymentContext subcategory level label value
trackUserContextFlow    :: Subcategory -> Level -> String -> UserContextValue -> Flow Unit
trackUserContextFlow subcategory level label value = doAff $ liftEffect $ trackUserContext subcategory level label value

main :: Effect Unit
main = pure unit
