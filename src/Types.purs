module Tracker.Types where

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe)
import Data.String.Common (toLower)
import Foreign (Foreign)
import Foreign.Class (class Encode, encode)
import Prelude ((<<<), show, class Show, ($))
import Presto.Core.Utils.Encoding (defaultEncode)

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
  | Retry_Suggestion RetrySuggestion
  | Retry_Txn RetryTxn
  | Retry_Config RetryConfig
  | Payment_Status PaymentStatus
  | Pig_Name PigName
  | Poll Polling
  | Poll_Status PollStatus
  | Priority_Apps PriorityApps
  | Quick_Pay_Info QuickPayInfo
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
  | Linked_Wallet_Selected LinkedWalletSelected
  | Unlinked_Wallet_Selected UnlinkedWalletSelected
  | Warning_Message WarningMessage
  | Title TitleName
  | Safetynet_In_Initiate SafetynetInInitiate
  | Safetynet_In_Initiate_Present SafetynetInInitiatePresent
  | Safetynet_Flow_Safetynet_Used SafetynetFlowSafetynetUsed
  | Safetynet_Resp_Time SafetynetRespTime
  | Safetynet_Resp_Time_Diff SafetynetRespTimeDiff
  | Vies_Error_Response ViesErrorResponse
  | Core_Initiate_Pay CoreInitiatePay
  | Initiate_Pay InitiatePay
  | Re_Enroll ReEnroll
  | Init_Enrollment InitEnrollment
  | Init_Enrollment_Flow InitEnrollmentFlow
  | Signed_Device_Data SignedDeviceData
  | Vies_Flow ViesFlow
  | Is_Token_Retained IsTokenRetained
  | On_Boarding OnBoarding
  | Vies_Error ViesError
  | Direct_Debit DirectDebit
  | Step_Up StepUp
  | Auto_Retry AutoRetry
  | Exit_SDK ExitSDK
  | Purge_Card PurgeCard
  | Core_Update_Enroll CoreUpdateEnroll
  | Update_Auth_Code UpdateAuthCode
  | Update_Id_Token UpdateIdToken
  | Update_Id_Token_Flow UpdateIdTokenFlow
  | Safetynet_Request SafetynetRequest
  | Safetynet_Request_Flow SafetynetRequestFlow
  | Find_Or_Register_Card_Account FindOrRegisterCardAccount
  | Find_Or_Register_Card_Account_Eligibility FindOrRegisterCardAccountEligibility
  | Create_Card_Account CreateCardAccount
  | Create_Key_Pair CreateKeyPair
  | Register_Device_Key RegisterDeviceKey
  | Auth_Code_Flow AuthCodeFlow
  | Validate_Device ValidateDevice
  | Submit_Pares SubmitPares
  | Submit_Pares_Flow SubmitParesFlow
  | Core_Device_Validation CoreDeviceValidation
  | Decrypt_Auth_Code DecryptAuthCode
  | Sync_Status SyncStatus
  | Chrome_Version ChromeVersion
  | Core_De_Enroll_Card CoreDeEnrollCard
  | De_Enroll_Card DeEnrollCard
  | Eligiiblity_Check_Flow EligibilityCheckFlow
  | Save_Card_Bank SaveCardBank
  | Update_Shared_Prefs UpdateSharedPrefs
  | Customer_Id CustomerId
  | Issuer_Name IssuerName
  | Initiate_Pay_Flow InitiatePayFlow
  | Should_Auto_Retry_On ShouldAutoRetryOn
  | Auto_Retry_Code AutoRetryCode
  | Auto_Retry_Reason AutoRetryReason
  | Encryption_Algo EncryptionAlgo
  | Auth_Code_Response AuthCodeResponse
  | Auth_Code AuthCode
  | Pay_Start PayStart
  | New_Pay_Start NewPayStart
  | Txns_ Txns
  | Submit_Pares_Foreign SubmitParesForeign
  | Eligibility_Resp Eligibility
  | Method_Eligibility MethodEligibility
  | Wallet_Selected WalletSelected
  | Card_FingerPrint CardFingerPrintInfo
  | SavedCardButtonClick SavedCardInfo
  | Gateway_Reference_Id_Check GatewayRefIdError
  | Txn_Details Foreign
  | Payment_Filter String
  | Funnel_Logs FunnelLogs
  | Separated_Wallets WalletTrackingData
  | Outage_Config OutageConfig
  | Payment_Info_Details PaymentInfoDetails

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
newtype RetrySuggestion = RetrySuggestion {
    response :: Array RetrySuggestionList
}

newtype RetryTxn = RetryTxn {
    status :: String
  , code :: String
  , pig :: Maybe String
  , hasFailed :: Boolean
}

newtype RetryConfig = RetryConfig {
    enableRetry :: Boolean
  , retryAttempts :: Int
  , showLinkedMethodsOnly :: Boolean
}

newtype RetrySuggestionList = RetrySuggestionList {
      priority :: Int
    , paymentMethodType :: String
    , paymentMethod :: String
    , isEligible :: Boolean
    , description :: String
    , balance :: Maybe Number
    , isLinked :: Boolean
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

newtype UnlinkedWalletSelected = UnlinkedWalletSelected {
  unlinked_wallet :: Maybe String,
  mandateSupport :: Maybe Boolean
}

newtype LinkedWalletSelected = LinkedWalletSelected {
  linked_wallet :: Maybe String,
  mandateSupport :: Maybe Boolean
}

newtype MethodEligibility = MethodEligibility {
  method_name :: String,
  eligibility :: Boolean
}

newtype Eligibility = Eligibility
  { customerId :: String
  , response :: Array PaymentMethodsEligibility
  }

newtype PaymentMethodsEligibility =
  PaymentMethodsEligibility
    { status :: String
    , paymentMethodType :: String
    , paymentMethod :: String
    , isEligible :: Boolean
    , description :: String
    , balance :: Maybe Number
    , gateway_error_message :: Maybe String
    , dueDate :: Maybe String
    , gatewayErrorMessage :: Maybe String
    }

newtype CardFingerPrintInfo = CardFingerPrintInfo {
  card_fingerprint :: {
      fingerprint :: String
    , card_type   :: String
    , card_brand  :: String
    , bank_name   :: String
    , card_bin    :: String
  }
}

newtype SavedCardInfo = SavedCardInfo {
  card_fingerprint :: {
      fingerprint :: String
    , card_type   :: String
    , card_brand  :: String
    , bank_name   :: String
  }
}

newtype FunnelLogs = FunnelLogs {
  type :: String,
  type_name :: String,
  stage_level :: Int,
  stage :: String,
  variation :: String,
  experiment_id :: String
}

newtype WalletSelected = WalletSelected {
  walletType :: String,
  walletName :: Maybe String,
  mandateSupport :: Maybe Boolean
}

newtype Wallet = Wallet {
  paymentMethod :: String,
  paymentMethodType :: String,
  pmSubType :: Maybe String,
  checkEligibility :: Maybe Boolean,
  walletFlowType :: Maybe String,
  directDebitSupport :: Maybe Boolean
}

newtype WalletTrackingData = WalletTrackingData {
  storedWallets :: Array Wallet,
  storedPayLaterWallets :: Array Wallet,
  unlinkedWallets :: Array Wallet,
  payLaterWallets :: Array Wallet,
  separateSectionWallets :: Array Wallet,
  sdkWallets :: Array Wallet,
  isFeatureOn :: Boolean
}

type CardInfo = {
  "card_type" :: String,
  "card_brand" :: String,
  "bank_name" :: String,
  "mandateSupport" :: Maybe Boolean
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


newtype QuickPayInfo = QuickPayInfo {
  method_name :: String,
  payment_source :: PaymentSourceResponse
}

newtype OutageConfig = OutageConfig {
    "restrictPayment" :: String,
    "showOutage" :: String,
    "message" :: String,
    "color" :: String
  }

newtype PaymentInfoDetails = PaymentInfoDetails {
    outageSeverity :: String,
    paymentMethod :: String,
    paymentMethodType :: String,
    isLastUsed :: Boolean,
    isSaved :: Boolean,
    orderId :: String,
    txnType :: String,
    usedCount :: Number
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

------------------------ VIES TYPES START --------------------

newtype TitleName = TitleName {
  "title" :: String
}

newtype SafetynetInInitiate = SafetynetInInitiate {
  "safetynet_in_initiate" :: String
}

newtype SafetynetInInitiatePresent = SafetynetInInitiatePresent {
  "safetynet_in_initiate" :: Boolean
}

newtype SafetynetFlowSafetynetUsed = SafetynetFlowSafetynetUsed {
  "safetynet_flow_safetynet_used" :: Maybe String
}

newtype SafetynetRespTime = SafetynetRespTime {
  "safetynet_resp_time" :: Number
}

newtype SafetynetRespTimeDiff = SafetynetRespTimeDiff {
  "safetynet_resp_time_diff" :: Int
}

newtype ViesErrorResponse = ViesErrorResponse {
  "vies_error_response" :: String
}

newtype CoreInitiatePay = CoreInitiatePay {
  "core_initiate_pay" :: String
}

newtype InitiatePay = InitiatePay {
  "initiate_pay" :: String
}

newtype ReEnroll = ReEnroll {
  "re_enroll" :: String
}

newtype InitEnrollment = InitEnrollment {
  "init_enrollment" :: String
}

type FlowLog = {
  success :: Boolean
  , status :: String
  }

newtype InitEnrollmentFlow = InitEnrollmentFlow {
  "init_enrollment_flow" :: FlowLog
}

type GenericLog = {
  value :: String,
  error :: Boolean
}

newtype SignedDeviceData = SignedDeviceData {
  "signed_device_data" :: GenericLog
}

newtype ViesFlow = ViesFlow {
  "vies_flow" :: String
}

newtype IsTokenRetained = IsTokenRetained {
  "is_token_retained" :: Boolean
}

newtype OnBoarding = OnBoarding {
  "onboarding" :: String
}

newtype ViesError = ViesError {
  "error" :: String
}

newtype GatewayRefIdError = GatewayRefIdError {
  "error" :: String
}

newtype DirectDebit = DirectDebit {
  "direct_debit" :: String
}

newtype StepUp = StepUp {
  "stepup" :: String
}

newtype AutoRetry = AutoRetry {
  "auto_retry" :: String
}

newtype ExitSDK = ExitSDK {
  "exit_sdk" :: String
}

newtype PurgeCard = PurgeCard {
  "purge_card" :: String
}

newtype CoreUpdateEnroll = CoreUpdateEnroll {
  "core_update_enroll" :: String
}

newtype UpdateAuthCode = UpdateAuthCode {
  "updateAuthCode" :: String
}

newtype UpdateIdToken = UpdateIdToken {
  "update_id_token" :: String
}

newtype UpdateIdTokenFlow = UpdateIdTokenFlow {
  "update_id_token_flow" :: FlowLog
}

newtype SafetynetRequest = SafetynetRequest {
  "safetynet_request" :: String
}

newtype SafetynetRequestFlow = SafetynetRequestFlow {
  "safetynet_request_flow" :: FlowLog
}

newtype FindOrRegisterCardAccount = FindOrRegisterCardAccount {
  "find_or_register_card_account" :: String
}

newtype FindOrRegisterCardAccountEligibility = FindOrRegisterCardAccountEligibility {
  "find_or_register_card_account:eligibility" :: String
}

newtype CreateCardAccount = CreateCardAccount {
  "create_card_account" :: String
}

newtype CreateKeyPair = CreateKeyPair {
  "create_key_pair" :: String
}

newtype RegisterDeviceKey = RegisterDeviceKey {
  "register_device_key" :: String
}

newtype AuthCodeFlow = AuthCodeFlow {
  "auth_code_flow" :: FlowLog
}

newtype ValidateDevice = ValidateDevice {
  "validateDevice" :: String
}

newtype SubmitPares = SubmitPares {
  "submit_pares" :: String
}

newtype SubmitParesFlow = SubmitParesFlow {
  "submit_pares_flow" :: FlowLog
}

newtype CoreDeviceValidation = CoreDeviceValidation {
  "core_device_validation" :: String
}

newtype DecryptAuthCode = DecryptAuthCode {
  "decrypt_auth_code" :: String
}

newtype SyncStatus = SyncStatus {
  "sync_status" :: String
}

newtype ChromeVersion = ChromeVersion {
  "chrome_version" :: String
}

newtype CoreDeEnrollCard = CoreDeEnrollCard {
  "core_de_enroll_card" :: String
}

newtype DeEnrollCard = DeEnrollCard {
  "de_enroll_card" :: String
}

type EligiLog = {
    success :: Boolean
  , status :: String
  , local :: Boolean
  }

newtype EligibilityCheckFlow = EligibilityCheckFlow {
  "eligibility_check_flow" :: EligiLog
}

newtype SaveCardBank = SaveCardBank {
  "saveCardBank" :: String
}

newtype UpdateSharedPrefs = UpdateSharedPrefs {
  "update_shared_prefs" :: String
}

newtype CustomerId = CustomerId {
  "customer_id" :: String
}

newtype IssuerName = IssuerName {
  "issuerName" :: String
}

newtype InitiatePayFlow = InitiatePayFlow {
  "initiate_pay_flow" :: FlowLog
}

newtype ShouldAutoRetryOn = ShouldAutoRetryOn {
  "should_auto_retry_on" :: String
}

newtype AutoRetryCode = AutoRetryCode {
  "auto_retry_code" :: String
}

newtype AutoRetryReason = AutoRetryReason {
  "auto_retry_reason" :: String
}

newtype EncryptionAlgo = EncryptionAlgo {
  "encryption_algo" :: String
}

newtype AuthCodeResponse = AuthCodeResponse {
  "auth_code_response" :: Foreign
}

newtype AuthCode = AuthCode {
  "auth_code" :: String
}

newtype PayStart = PayStart {
  "pay/start" :: String
}

newtype NewPayStart = NewPayStart {
  "new pay/start" :: String
}

newtype Txns = Txns {
  "txns" :: String
}

newtype SubmitParesForeign = SubmitParesForeign {
  "submit_pares" :: Foreign
}

------------------------ VIES TYPES END ----------------------

------------------------ COMMON TYPES START ------------------
newtype NoValue
  = NoValue
    { "" :: String}

newtype BankSelected
  = BankSelected
    {
      "bank_name" :: String,
      "mandateSupport" :: Maybe Boolean,
      "bank_code" :: String
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
derive instance genericRetrySuggestion :: Generic RetrySuggestion _
derive instance genericRetryTxn :: Generic RetryTxn _
derive instance genericRetryConfig :: Generic RetryConfig _
derive instance genericRetrySuggestionList :: Generic RetrySuggestionList _
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
derive instance genericLinkedWalletSelected :: Generic LinkedWalletSelected _
derive instance genericUnlinkedWalletSelected :: Generic UnlinkedWalletSelected _
derive instance genericWalletSelected :: Generic WalletSelected _
derive instance genericMethodEligibility :: Generic MethodEligibility _
derive instance genericEligibility :: Generic Eligibility _
derive instance genericPaymentMethodsEligibility :: Generic PaymentMethodsEligibility _
derive instance genericWarningMessage :: Generic WarningMessage _
derive instance genericTitleName :: Generic TitleName _
derive instance genericSafetynetInInitiate :: Generic SafetynetInInitiate _
derive instance genericSafetynetInInitiatePresent :: Generic SafetynetInInitiatePresent _
derive instance generidSafetynetFlowSafetynetUsed :: Generic SafetynetFlowSafetynetUsed _
derive instance genericSafetynetRespTime :: Generic SafetynetRespTime _
derive instance genericSafetynetRespTimeDiff :: Generic SafetynetRespTimeDiff _
derive instance genericViesErrorResponse :: Generic ViesErrorResponse _
derive instance genericCoreInitiatePay :: Generic CoreInitiatePay _
derive instance genericInitiatePay :: Generic InitiatePay _
derive instance genericReEnroll :: Generic ReEnroll _
derive instance genericInitEnrollment :: Generic InitEnrollment _
derive instance genericInitEnrollmentFlow :: Generic InitEnrollmentFlow _
derive instance gnericSignedDeviceData :: Generic SignedDeviceData _
derive instance genericViesFlow :: Generic ViesFlow _
derive instance genericIsTokenRetained :: Generic IsTokenRetained _
derive instance genericOnBoarding :: Generic OnBoarding _
derive instance genericViesError :: Generic ViesError _
derive instance genericDirectDebit :: Generic DirectDebit _
derive instance genericStepUp :: Generic StepUp _
derive instance genericAutoRetry :: Generic AutoRetry _
derive instance genericExitSDK :: Generic ExitSDK _
derive instance genericPurgeCard :: Generic PurgeCard _
derive instance genericCoreUpdateEnroll :: Generic CoreUpdateEnroll _
derive instance genericUpdateAuthCode :: Generic UpdateAuthCode _
derive instance genericUpdateIdToken :: Generic UpdateIdToken _
derive instance genericUpdateIdTokenFlow :: Generic UpdateIdTokenFlow _
derive instance genericSafetynetRequest :: Generic SafetynetRequest _
derive instance genericSafetynetRequestFlow :: Generic SafetynetRequestFlow _
derive instance genericFindOrRegisterCardAccount :: Generic FindOrRegisterCardAccount _
derive instance genericFindOrRegisterCardAccountEligibility :: Generic FindOrRegisterCardAccountEligibility _
derive instance genericCreateCardAccount :: Generic CreateCardAccount _
derive instance genericCreateKeyPair :: Generic CreateKeyPair _
derive instance genericRegisterDeviceKey :: Generic RegisterDeviceKey _
derive instance genericAuthCodeFlow :: Generic AuthCodeFlow _
derive instance genericValidateDevice :: Generic ValidateDevice _
derive instance genericSubmitPares :: Generic SubmitPares _
derive instance genericSubmitParesFlow :: Generic SubmitParesFlow _
derive instance genericCoreDeviceValidation :: Generic CoreDeviceValidation _
derive instance genericDecryptAuthCode :: Generic DecryptAuthCode _
derive instance genericSyncStatus :: Generic SyncStatus _
derive instance genericChromeVersion :: Generic ChromeVersion _
derive instance genericCoreDeEnrollCard :: Generic CoreDeEnrollCard _
derive instance genericDeEnrollCard :: Generic DeEnrollCard _
derive instance genericEligibilityCheckFlow :: Generic EligibilityCheckFlow _
derive instance genericSaveCardBank :: Generic SaveCardBank _
derive instance genericUpdateSharedPrefs :: Generic UpdateSharedPrefs _
derive instance genericCustomerId :: Generic CustomerId _
derive instance genericIssuerName :: Generic IssuerName _
derive instance genericInitiatePayFlow :: Generic InitiatePayFlow _
derive instance genericShouldAutoRetryOn :: Generic ShouldAutoRetryOn _
derive instance genericAutoRetryCode :: Generic AutoRetryCode _
derive instance genericAutoRetryReason :: Generic AutoRetryReason _
derive instance genericEncryptionAlgo :: Generic EncryptionAlgo _
derive instance genericAuthCodeResponse :: Generic AuthCodeResponse _
derive instance genericAuthCode :: Generic AuthCode _
derive instance genericPayStart :: Generic PayStart _
derive instance genericNewPayStart :: Generic NewPayStart _
derive instance genericTxns :: Generic Txns _
derive instance genericSubmitParesForeign :: Generic SubmitParesForeign _
derive instance genericCardFingerPrintInfo :: Generic CardFingerPrintInfo _
derive instance genericSavedCardInfo :: Generic SavedCardInfo _
derive instance genericGatewayRefIdError :: Generic GatewayRefIdError _
derive instance genericQuickPayInfo :: Generic QuickPayInfo _
derive instance genericFunnelLogs :: Generic FunnelLogs _
derive instance genericWallet :: Generic Wallet _
derive instance genericWalletTrackingData :: Generic WalletTrackingData _
derive instance genericOutageConfig :: Generic OutageConfig _
derive instance genericPaymentInfoDetails :: Generic PaymentInfoDetails _

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
  encode (Retry_Suggestion a) = defaultEncode a
  encode (Retry_Txn a) = defaultEncode a
  encode (Retry_Config a) = defaultEncode a
  encode (Payment_Status a) = defaultEncode a
  encode (Pig_Name a) = defaultEncode a
  encode (Poll a) = defaultEncode a
  encode (Poll_Status a) = defaultEncode a
  encode (Priority_Apps a) = defaultEncode a
  encode (Quick_Pay_Info a) = defaultEncode a
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
  encode (Linked_Wallet_Selected a) = defaultEncode a
  encode (Unlinked_Wallet_Selected a) = defaultEncode a
  encode (Warning_Message a) = defaultEncode a
  encode (Title a) = defaultEncode a
  encode (Safetynet_In_Initiate a) = defaultEncode a
  encode (Safetynet_In_Initiate_Present a) = defaultEncode a
  encode (Safetynet_Flow_Safetynet_Used a) = defaultEncode a
  encode (Safetynet_Resp_Time a) = defaultEncode a
  encode (Safetynet_Resp_Time_Diff a) = defaultEncode a
  encode (Vies_Error_Response a) = defaultEncode a
  encode (Core_Initiate_Pay a) = defaultEncode a
  encode (Initiate_Pay a) = defaultEncode a
  encode (Re_Enroll a) = defaultEncode a
  encode (Init_Enrollment a) = defaultEncode a
  encode (Init_Enrollment_Flow a) = defaultEncode a
  encode (Signed_Device_Data a) = defaultEncode a
  encode (Vies_Flow a) = defaultEncode a
  encode (Is_Token_Retained a) = defaultEncode a
  encode (On_Boarding a) = defaultEncode a
  encode (Vies_Error a) = defaultEncode a
  encode (Direct_Debit a) = defaultEncode a
  encode (Step_Up a) = defaultEncode a
  encode (Auto_Retry a) = defaultEncode a
  encode (Exit_SDK a) = defaultEncode a
  encode (Purge_Card a) = defaultEncode a
  encode (Core_Update_Enroll a) = defaultEncode a
  encode (Update_Auth_Code a) = defaultEncode a
  encode (Update_Id_Token a) = defaultEncode a
  encode (Update_Id_Token_Flow a) = defaultEncode a
  encode (Safetynet_Request a) = defaultEncode a
  encode (Safetynet_Request_Flow a) = defaultEncode a
  encode (Find_Or_Register_Card_Account a) = defaultEncode a
  encode (Find_Or_Register_Card_Account_Eligibility a) = defaultEncode a
  encode (Create_Card_Account a) = defaultEncode a
  encode (Create_Key_Pair a) = defaultEncode a
  encode (Register_Device_Key a) = defaultEncode a
  encode (Auth_Code_Flow a) = defaultEncode a
  encode (Validate_Device a) = defaultEncode a
  encode (Submit_Pares a) = defaultEncode a
  encode (Submit_Pares_Flow a) = defaultEncode a
  encode (Core_Device_Validation a) = defaultEncode a
  encode (Decrypt_Auth_Code a) = defaultEncode a
  encode (Sync_Status a) = defaultEncode a
  encode (Chrome_Version a) = defaultEncode a
  encode (Core_De_Enroll_Card a) = defaultEncode a
  encode (De_Enroll_Card a) = defaultEncode a
  encode (Eligiiblity_Check_Flow a) = defaultEncode a
  encode (Save_Card_Bank a) = defaultEncode a
  encode (Update_Shared_Prefs a) = defaultEncode a
  encode (Customer_Id a) = defaultEncode a
  encode (Issuer_Name a) = defaultEncode a
  encode (Initiate_Pay_Flow a) = defaultEncode a
  encode (Should_Auto_Retry_On a) = defaultEncode a
  encode (Auto_Retry_Code a) = defaultEncode a
  encode (Auto_Retry_Reason a) = defaultEncode a
  encode (Encryption_Algo a) = defaultEncode a
  encode (Auth_Code_Response a) = defaultEncode a
  encode (Auth_Code a) = defaultEncode a
  encode (Pay_Start a) = defaultEncode a
  encode (New_Pay_Start a) = defaultEncode a
  encode (Txns_ a) = defaultEncode a
  encode (Submit_Pares_Foreign a) = defaultEncode a
  encode (Method_Eligibility a) = defaultEncode a
  encode (Eligibility_Resp a) = defaultEncode a
  encode (Wallet_Selected a) = defaultEncode a
  encode (Card_FingerPrint a) = defaultEncode a
  encode (SavedCardButtonClick a) = defaultEncode a
  encode (Gateway_Reference_Id_Check a) = defaultEncode a
  encode (Txn_Details a) = a
  encode (Payment_Filter a) = encode a
  encode (Funnel_Logs a) = defaultEncode a
  encode (Separated_Wallets a) = defaultEncode a
  encode (Outage_Config a) = defaultEncode a
  encode (Payment_Info_Details a) = defaultEncode a


derive instance genericAppLifeCycleValues :: Generic AppLifeCycleValues _
instance encodeAppLifeCycleValues :: Encode AppLifeCycleValues where encode = defaultEncode

instance encodePaymentMethodsEligibility :: Encode PaymentMethodsEligibility where encode = defaultEncode
instance encodeRetrySuggestionList :: Encode RetrySuggestionList where encode = defaultEncode


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

instance encodePaymentSourceResponse :: Encode PaymentSourceResponse where encode = defaultEncode

instance encodeWallet :: Encode Wallet where encode = defaultEncode

instance encodeWalletTrackingData :: Encode WalletTrackingData where encode = defaultEncode
