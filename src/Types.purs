module Tracker.Types where

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.String.Common (toLower)
import Foreign (Foreign)
import Foreign.Class (class Encode, encode)
import Prelude ((<<<), show, class Show, ($))
import Presto.Core.Utils.Encoding (defaultDecode, defaultEncode)

data LIFECYCLE' = LIFECYCLE
data ACTION' = ACTION
data API_CALL' = API_CALL
data SCREEN' = SCREEN
data CONTEXT' = CONTEXT

-- Add instances for new subcategory accordingly
data Lifecycle = Android | Ios | Web | Hypersdk | Microapp | WebJos
data Action = User | System
data ApiCall = Network | Sdk | Microapp_AC | Management
data Screen = Screen
data Context = Device | Merchant | Hypersdk_C | Network_C | Payment | User_C  | Page

data Values
  = Bank_Selected BankSelected
  | Before_Filter BeforeFiltering
  | Browser_Type String
  | Button_Click ButtonClick
  | Payment_Details Foreign
  | Payment_Method PaymentMethod
  | After_Filter AfterFiltering
  | Api_Variant ApiVariant
  | App_Response AppResponse
  | App_Filter AppFilter
  | App_Life_Cycle AppLifeCycle
  | Auth AuthStatus
  | Card_Details CardDetails
  | Card_Number_Changed CardNumberChanged
  | Checkbox_Details CheckboxDetails
  | Config_Fetch ConfigFetch
  | Cred_Pay CredPay
  | Custom_Tab_Payments CustomTabPayments 
  | Cvv_Changed CvvChanged
  | Default_Option DefaultOption
  | Device_Type String
  | Dialog_Rendered DialogRendered
  | Disable_Popup DisablePopup
  | Ended EndedType
  | Expiry_Date_Changed ExpiryDateChanged
  | Field_Focussed FieldFocussed
  | Input_Validation InputValidation
  | Latency LatencyValue
  | Link_Wallet_Status LinkWalletStatus
  | Microapp_Status MicroAppStatus
  | Mobile_Number_Changed MobileNumberChanged
  | Nb_Search NbSearch
  | Network_Connection String
  | No_Value NoValue
  | OTP_Detected OTPDetected
  | OTP_Populated OTPPopulated
  | OTP_Auto_Submit OTPAutoSubmit
  | OTP_CHANGED OTPChanged
  | OTP_Status OTPStatus
  | OTP_Submit OTPSubmit
  | OTP_Length OTPLength
  | Outage OutageMessage
  | Payment_Attempt PaymentAttempt
  | Payment_Info PaymentInfo
  | Payment_Source_Response PaymentSourceResponse
  | Payment_Status PaymentStatus
  | Pig_Name PigName
  | Poll Polling
  | Poll_Status PollStatus
  | Priority_Apps PriorityApps
  | Screen_Rendered ScreenRendered
  | Started StartedType
  | Sms_Count SmsCount
  | Sms_Received SmsReceived
  | UPI_Apps UPIApps
  | Used_To_Pay UsedToPay
  | Unknown Foreign
  | Vpa_Changed VpaChanged
  | Vpa_Save VpaSave
  | Vpa_Selected VpaSelected
  | Wallet_Selected WalletSelected
  | Warning_Message WarningMessage
  | Emi_Eligibility EmiEligibility


---------------------- DOTP TYPES START -----------------------
newtype SmsReceived = SmsReceived {
  "sms_received" :: Boolean
}
newtype SmsCount = SmsCount {
  type :: String,
  count :: Int
}
newtype AuthStatus = AuthStatus {
  parameter :: String,
  status :: Boolean
} 

newtype OTPStatus = OTPStatus {
  "otp_status" :: Boolean
}

newtype PaymentInfo = PaymentInfo {
  orderId :: String
, amount :: String
}

newtype  OTPDetected = OTPDetected {
  "is_detected" :: Boolean
}
newtype OTPPopulated = OTPPopulated {
  "is_populated" :: Boolean
}

newtype OTPAutoSubmit = OTPAutoSubmit {
  "is_auto_submitted" :: Boolean
}

newtype OTPSubmit = OTPSubmit {
  "otp_submitted" :: Boolean
}

newtype OTPLength = OTPLength {
  "otp_length" :: String
}
---------------------- DOTP TYPES END ------------------------

------------------------ UPI TYPES START ---------------------
data PollTypes = St String | In Int

newtype VpaSave = VpaSave {
  "vpa_saved" :: Boolean
}
newtype AppResponse = AppResponse {
  action :: String,
  response :: Foreign
}
newtype PollStatus = PollStatus {
  key :: String,
  status :: PollTypes
}

newtype ScreenRendered = ScreenRendered {
  "screen_name" :: String
}
newtype ConfigFetch = ConfigFetch {
  "config_item_fetch" :: ConfigInfo
}

type ConfigInfo = {
  "config_item_path" :: Array String,
  "config_item_value" :: Foreign
}

newtype PriorityApps = PriorityApps { 
  "priority_apps" :: Array String
}
newtype AppFilter = AppFilter {
  "app_filters" :: AppFilterList
}

type AppFilterList = {
  filter_type :: String,
  list :: Array String
}

newtype AfterFiltering = AfterFiltering {
  "after_filtering" :: Foreign
}
newtype BeforeFiltering = BeforeFiltering {
  "before_filtering" :: Foreign
}
newtype UsedToPay = UsedToPay {
  "used_to_pay" :: Foreign
}
------------------------ UPI TYPES END -----------------------

------------------------ HYPERPAY TYPES START ----------------
data CheckboxTypes = Checkbox_Info CheckboxInfo | Checkbox_State CheckboxState

newtype InputValidation = InputValidation {
  field_validation :: String,
  is_valid :: Boolean
}

newtype LinkWalletStatus = LinkWalletStatus {
  "wallet_linked" :: Boolean
}

newtype StartedType = StartedType {
  "started" :: StartedRequest
}

newtype EndedType = EndedType {
  "ended" :: EndedResponse
}

type StartedRequest = 
  { requestId :: String
  , payload :: Foreign
  , service :: String
  }

type EndedResponse =
  { requestId :: String
  , payload :: Foreign
  , service :: String
  , error :: Boolean
  , errorMessage :: String
  , errorCode  :: String
  }
newtype DefaultOption = DefaultOption {
  action :: String,
  perform_action :: Boolean,
  payment_option_type :: String,
  payment_option :: String
}
newtype PaymentStatus = PaymentStatus {
  "payment_status" :: String
}
newtype WarningMessage = WarningMessage {
  "message" :: String
}
newtype VpaChanged = VpaChanged {
  "VpaScreen" :: String
}
newtype MobileNumberChanged = MobileNumberChanged {
  "VerifyNumberScreen" :: String
}
newtype NbSearch = NbSearch {
  "nb_search_form_cancelled" :: String
}
newtype PaymentAttempt = PaymentAttempt {
  type :: String,
  val  :: Foreign
}
newtype CardNumberChanged = CardNumberChanged {
  "AddCardScreen" :: String
}

newtype ExpiryDateChanged = ExpiryDateChanged {
  "AddCardScreen" :: String
}
newtype OutageMessage = OutageMessage {
  "outage" :: String
}
newtype ApiVariant = ApiVariant {
  "api_variant" :: String
}
newtype PaymentSourceResponse = PaymentSourceResponse {
  name :: String,
  resp :: Foreign
}
newtype CardDetails = CardDetails {
  "card_details" :: CardInfo
}
newtype CvvChanged = CvvChanged {
  screenName :: String,
  cvv :: String
}
newtype PigName = PigName {
  "pig_name" :: String
}
newtype DisablePopup = DisablePopup {
  "disablePopup" :: Boolean
}
newtype DialogRendered = DialogRendered {
  "upi_collect" :: DialogBox
}
newtype CheckboxDetails = CheckboxDetails {
  "checkbox_details" :: CheckboxTypes
}
newtype VpaSelected = VpaSelected {
  "vpa_selected" :: String
}
newtype FieldFocussed = FieldFocussed {
  fieldName :: String,
  status :: String
}

newtype WalletSelected = WalletSelected {
  walletType :: String,
  walletName :: Maybe String
}

newtype EmiEligibility = EmiEligibility {
  eligibility :: Boolean
}




type CardInfo = {
  "card_type" :: String,
  "card_brand" :: String,
  "bank_name" :: String
}
type CheckboxState = {
  checkbox_name :: String,
  state :: String
}
type CheckboxInfo = {
  checkbox_name :: String,
  payment_instrument :: String
}

type DialogBox = {
  "dialog_box" :: String
}

----------------------- HYPERPAY TYPES END --------------------

----------------------- EC TYPES STARTED ----------------------
data AppLifeCycleValues =  Status AppStatus | Version AppVersion | Present AppPresent | SDK_Status SDKStatus | Token_SDK_Present TokenSDKPresent | Non_Token_SDK_Present NonTokenSDKPresent 
data CredPayValues = Source_Eligibilty SourceEligibilty | User_Id_Update UserIdUpdate | User_Context UserContext | Flow_Status FlowStatus | Flow_Response FlowResponse 

newtype CustomTabPayments = CustomTabPayments {
  "cct" :: Foreign
}
newtype AppLifeCycle = AppLifeCycle {
  appName :: String,
  value :: AppLifeCycleValues
}

newtype CredPay = CredPay {
  "cred_pay" :: CredPayValues
}

newtype MicroAppStatus = MicroAppStatus {
  mAppName :: String,
  status :: Foreign
}

type FlowStatus = {
  flow :: String
}

type FlowResponse = {
  flowStatus :: String,
  flowResponse :: Foreign
}

type UserIdUpdate = {
  "user_id_updated" :: Boolean
}

type UserContext = {
  "user_context" :: String
}

type SourceEligibilty = {
  "source_of_eligibilty" :: String
}

newtype Polling = Polling {
  "polling" :: StopPolling
}

type StopPolling = {
  stopped :: Int,
  description :: String
}

type TokenSDKPresent = {
  "TokenSDK_Present" :: Boolean
}
type NonTokenSDKPresent = {
  "NonTokenSDK_Present" :: Boolean
}

type SDKStatus = {
  "sdk" :: String,
  "status" :: String
}

type AppStatus = {
  "status" :: String
}

type AppVersion = {
  "app_version" :: Maybe String
}

type AppPresent = {
  "app_present" :: Boolean
}

------------------------ EC TYPES END ------------------------

------------------------ COMMON TYPES START ------------------
newtype NoValue
  = NoValue
    { "" :: String}

newtype BankSelected
  = BankSelected
    {
      "bank_name" :: String
    }
newtype UPIApp =
  UPIApp
    { packageName :: String
    , appName :: String
    , iconUrl :: Maybe String
    , supportsMandate :: Maybe Boolean
    , supportsPay :: Maybe Boolean
    }

newtype UPIApps
  = UPIApps
  {
    "upi_app_selected" :: UPIApp
  }

newtype PaymentMethod 
  = PaymentMethod
  { 
    "method_name" :: String
  }
newtype OTPChanged
  = OTPChanged
  {
    "OtpScreen" :: String
  }

newtype ButtonClick
  = ButtonClick
  {
    "button_name" :: String
  }

newtype LatencyValue
  = LatencyValue
  {
    "latency" :: String
  }

------------------------ COMMON TYPES END --------------------

class Category a b where
  showCategory :: a -> b -> String

instance catLifecycle :: Category LIFECYCLE' Lifecycle where
  showCategory LIFECYCLE l = "lifecycle"

instance catAction :: Category ACTION' Action where
  showCategory ACTION a = "action"

instance catApiCall :: Category API_CALL' ApiCall where
  showCategory API_CALL ac = "api_call"

instance catContext :: Category CONTEXT' Context where
  showCategory CONTEXT c = "context"

instance catScreen :: Category SCREEN' Screen where
  showCategory SCREEN s = "screen"

data Level
  = Info
  | Debug
  | Error
  | Critical
  | Warning
  | Exception

-- Instances

instance encodeLifecycle :: Encode Lifecycle where
  encode = encode <<< show

derive instance lifecycle :: Generic Lifecycle _
instance showLifecycle :: Show Lifecycle where
  show = toLower <<< genericShow

instance encodeAction :: Encode Action where
  encode = encode <<< show

derive instance action :: Generic Action _
instance showAction :: Show Action where
  show = toLower <<< genericShow

instance encodeApiCall :: Encode ApiCall where
  encode = encode <<< show

derive instance apiCall :: Generic ApiCall _
instance showApi_Call :: Show ApiCall where
  show Microapp_AC = "microapp"
  show x = toLower $ genericShow x

instance encodeScreen :: Encode Screen where
  encode = encode <<< show

derive instance screen :: Generic Screen _
instance showScreen :: Show Screen where
  show = toLower <<< genericShow

instance encodeContext :: Encode Context where
  encode = encode <<< show

derive instance context :: Generic Context _
instance showContext :: Show Context where
  show Hypersdk_C = "hypersdk"
  show Network_C = "network"
  show User_C = "user"
  show x = toLower $ genericShow x

derive instance level :: Generic Level _
instance showLevel :: Show Level where
  show = toLower <<< genericShow



derive instance genericBankSelected :: Generic BankSelected _
derive instance genericBeforeFiltering :: Generic BeforeFiltering _
derive instance genericButtonClick :: Generic ButtonClick _
derive instance genericPaymentMethod :: Generic PaymentMethod _
derive instance genericAfterFiltering :: Generic AfterFiltering _
derive instance genericApiVariant :: Generic ApiVariant _
derive instance genericAppResponse :: Generic AppResponse _
derive instance genericAppFilter :: Generic AppFilter _
derive instance genericAppLifeCycle :: Generic AppLifeCycle _
derive instance genericAuthStatus :: Generic AuthStatus _
derive instance genericCardDetails :: Generic CardDetails _
derive instance genericCardNumberChanged :: Generic CardNumberChanged _
derive instance genericCheckboxDetails :: Generic CheckboxDetails _
derive instance genericConfigFetch :: Generic ConfigFetch _
derive instance genericCredPay :: Generic CredPay _
derive instance genericCustomTabPayments :: Generic CustomTabPayments _
derive instance genericCvvChanged :: Generic CvvChanged _
derive instance genericDefaultOption :: Generic DefaultOption _
derive instance genericDialogRendered :: Generic DialogRendered _
derive instance genericDisablePopup :: Generic DisablePopup _
derive instance genericEndedType :: Generic EndedType _
derive instance genericExpiryDateChanged :: Generic ExpiryDateChanged _
derive instance genericFieldFocussed :: Generic FieldFocussed _
derive instance genericInputValidation :: Generic InputValidation _
derive instance genericLatencyValue :: Generic LatencyValue _
derive instance genericLinkWalletStatus :: Generic LinkWalletStatus _
derive instance genericMicroAppStatus :: Generic MicroAppStatus _
derive instance genericMobileNumberChanged :: Generic MobileNumberChanged _
derive instance genericNbSearch :: Generic NbSearch _
derive instance genericNoValue :: Generic NoValue _
derive instance genericOTPDetected :: Generic OTPDetected _
derive instance genericOTPPopulated :: Generic OTPPopulated _
derive instance genericOTPAutoSubmit :: Generic OTPAutoSubmit _
derive instance genericOTPChanged :: Generic OTPChanged _
derive instance genericOTPStatus :: Generic OTPStatus _
derive instance genericOTPSubmit :: Generic OTPSubmit _
derive instance genericOTPLength :: Generic OTPLength _
derive instance genericOutageMessage :: Generic OutageMessage _
derive instance genericPaymentAttempt :: Generic PaymentAttempt _
derive instance genericPaymentInfo :: Generic PaymentInfo _
derive instance genericPaymentSourceResponse :: Generic PaymentSourceResponse _
derive instance genericPaymentStatus :: Generic PaymentStatus _
derive instance genericPigName :: Generic PigName _
derive instance genericPolling :: Generic Polling _
derive instance genericPollStatus :: Generic PollStatus _
derive instance genericPriorityApps :: Generic PriorityApps _
derive instance genericScreenRendered :: Generic ScreenRendered _
derive instance genericStartedType :: Generic StartedType _
derive instance genericSmsCount :: Generic SmsCount _
derive instance genericSmsReceived :: Generic SmsReceived _
derive instance genericUPIApps :: Generic UPIApps _
derive instance genericUsedToPay :: Generic UsedToPay _
derive instance genericVpaChanged :: Generic VpaChanged _
derive instance genericVpaSave :: Generic VpaSave _
derive instance genericVpaSelected :: Generic VpaSelected _
derive instance genericWalletSelected :: Generic WalletSelected _
derive instance genericEmiEligibility :: Generic EmiEligibility _
derive instance genericWarningMessage :: Generic WarningMessage _



derive instance genericValues :: Generic Values _
instance encodeValues :: Encode Values where
  encode (Bank_Selected a) = defaultEncode a 
  encode (Before_Filter a) = defaultEncode a
  encode (Browser_Type a) = encode a
  encode (Button_Click a) = defaultEncode a
  encode (Payment_Details a) = a
  encode (Payment_Method a) = defaultEncode a
  encode (After_Filter a) = defaultEncode a
  encode (Api_Variant a) = defaultEncode a
  encode (App_Response a) = defaultEncode a
  encode (App_Filter a) = defaultEncode a
  encode (App_Life_Cycle a) = defaultEncode a
  encode (Auth a) = defaultEncode a
  encode (Card_Details a) = defaultEncode a
  encode (Card_Number_Changed a) = defaultEncode a
  encode (Checkbox_Details a) = defaultEncode a
  encode (Config_Fetch a) = defaultEncode a
  encode (Cred_Pay a) = defaultEncode a
  encode (Custom_Tab_Payments a) = defaultEncode a 
  encode (Cvv_Changed a) = defaultEncode a
  encode (Default_Option a) = defaultEncode a
  encode (Device_Type a) = encode a
  encode (Dialog_Rendered a) = defaultEncode a
  encode (Disable_Popup a) = defaultEncode a
  encode (Ended a) = defaultEncode a
  encode (Expiry_Date_Changed a) = defaultEncode a
  encode (Field_Focussed a) = defaultEncode a
  encode (Input_Validation a) = defaultEncode a
  encode (Latency a) = defaultEncode a
  encode (Link_Wallet_Status a) = defaultEncode a
  encode (Microapp_Status a) = defaultEncode a
  encode (Mobile_Number_Changed a) = defaultEncode a
  encode (Nb_Search a) = defaultEncode a
  encode (Network_Connection a) = encode a
  encode (No_Value a) = defaultEncode a
  encode (OTP_Detected a) = defaultEncode a
  encode (OTP_Populated a) = defaultEncode a
  encode (OTP_Auto_Submit a) = defaultEncode a
  encode (OTP_CHANGED a) = defaultEncode a
  encode (OTP_Status a) = defaultEncode a
  encode (OTP_Submit a) = defaultEncode a
  encode (OTP_Length a) = defaultEncode a
  encode (Outage a) = defaultEncode a
  encode (Payment_Attempt a) = defaultEncode a
  encode (Payment_Info a) = defaultEncode a
  encode (Payment_Source_Response a) = defaultEncode a
  encode (Payment_Status a) = defaultEncode a
  encode (Pig_Name a) = defaultEncode a
  encode (Poll a) = defaultEncode a
  encode (Poll_Status a) = defaultEncode a
  encode (Priority_Apps a) = defaultEncode a
  encode (Screen_Rendered a) = defaultEncode a
  encode (Started a) = defaultEncode a
  encode (Sms_Count a) = defaultEncode a
  encode (Sms_Received a) = defaultEncode a
  encode (UPI_Apps a) = defaultEncode a
  encode (Used_To_Pay a) = defaultEncode a
  encode (Unknown a) = a
  encode (Vpa_Changed a) = defaultEncode a
  encode (Vpa_Save a) = defaultEncode a
  encode (Vpa_Selected a) = defaultEncode a
  encode (Wallet_Selected a) = defaultEncode a
  encode (Warning_Message a) = defaultEncode a
  encode (Emi_Eligibility a) = defaultEncode a


derive instance genericAppLifeCycleValues :: Generic AppLifeCycleValues _
instance encodeAppLifeCycleValues :: Encode AppLifeCycleValues where encode = defaultEncode



derive instance genericCheckboxTypes :: Generic CheckboxTypes _
instance encodeCheckBoxTypes :: Encode CheckboxTypes where encode = defaultEncode



derive instance genericCredPayValues :: Generic CredPayValues _
instance encodeCredPayValues :: Encode CredPayValues where encode = defaultEncode


derive instance genericPollTypes :: Generic PollTypes _
instance encodePollTypes :: Encode PollTypes where
  encode (St a) = encode a
  encode (In a) = encode a

derive instance genericUPIApp :: Generic UPIApp _
instance encodeUPIApp :: Encode UPIApp where encode = defaultEncode