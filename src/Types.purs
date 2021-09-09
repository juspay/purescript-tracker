module Tracker.Types where

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.String.Common (toLower)
import Foreign (Foreign)
import Foreign.Class (class Encode, encode)
import Prelude ((<<<), show, class Show, ($))

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
  | Context_Logs Context
  | Cred_Pay CredPay
  | Cvv_Changed CvvChanged
  | Default_Option DefaultOption
  | Device_Type String
  | Dialog_Rendered DialogRendered
  | Disable_Popup DisablePopup
  | Exit ExitResponse
  | Expiry_Date_Changed ExpiryDateChanged
  | Field_Focussed FieldFocussed
  | Latency LatencyValue
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

newtype AppFilterList = AppFilterList {
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

newtype StartedType
  = StartedType
    { requestId :: String
    , payload :: Foreign
    , service :: String
    , lifeCycleId :: Maybe String
    }

newtype ExitResponse =
  ExitResponse
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
