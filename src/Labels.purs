module Labels where

import Data.Generic.Rep.Show (genericShow)
import Data.Generic.Rep (class Generic)
import Data.String.Common (toLower)
import Foreign.Class (class Encode, encode)
import Prelude (class Show, show, (<<<))

data Label
  = On_create
  | On_start
  | On_resume
  | On_pause
  | On_stop
  | On_destroy
  | On_restart
  | On_receive
  | On_backpressed
  | On_save_instance_state
  | On_restore_instance_state
  | Init
  | Load_view
  | View_did_load
  | View_will_appear
  | View_did_appear
  | Did_receive_memory_warning
  | View_will_disappear
  | View_did_disappear
  | Otp_detected -- | On detection of OTP
  | Hyperservice
  | Prefetch_started
  | Prefetch_completed -- | On completion of prefetch
  | Initiate_started -- | On start of iniate
  | Process_started -- | On start of process
  | On_event_response
  | Terminate_started -- | On start of Terminate
  | Terminate_completed
  | Initiate_request
  | Initiate_response
  | Process_request
  | Process_response
  | Permission
  | External_sdk
  | Acs_interface
  | Crashes
  | Java_exceptions
  | Js_exception
  | User_errors
  | Potential_payment_flow_error
  | Modify_page_error
  | Pom_check_failure
  | Dialog_box
  | Screens
  | Os
  | Os_version
  | Manufacturer
  | Model
  | Brand
  | Screen_width
  | Screen_height
  | Mac_addres
  | Device_id
  | Android_id
  | Google_adid
  | Android_version
  | Storage
  | Chrome_web_view_version
  | Merchant_id
  | Client_id
  | Transaction_id
  | Order_id
  | Merchant_app_version
  | Merchant_preference
  | App_name
  | Sdk_version
  | Microapp_version
  | Config_version
  | Acs_version
  | Boot_loader_version
  | Is_godel
  | Experiment
  | Sim_operator
  | Signal_strength
  | Payment_instrument_group
  | Payment_instrument
  | Payment_gateway
  | Aggregator
  | Card_brand
  | Payment_status
  | Auth_method
  | Authentication_status
  | Dropout_reasons
  | Email_id
  | Customer_id
  | Phone_number
  | Transaction_latency
  | System_time

instance encodeLabel :: Encode Label where
  encode = encode <<< toLower <<< show

derive instance label :: Generic Label _
instance showLabel :: Show Label where
  show = genericShow