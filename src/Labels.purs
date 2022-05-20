module Tracker.Labels where

import Foreign.Class (class Encode, encode)
import Prelude (class Show, show, (<<<))

data Label
  = BUTTON_CLICKED
  | OTP_INFO
  | SMS_INFO
  | DETAILS
  | DECODE_ERROR
  | ON_ACTIVITY_LIFE_CYCLE_EVENT
  | CONFIG_FETCH
  | NETWORK
  | UPI_APPS
  | STATUS
  | PROCESS
  | INITIATE
  | AUTHENTICATION_STATUS
  | PRESTO_EXCEPTION
  | INITIATE_REQUEST
  | INITIATE_STARTED
  | INITIATE_FINISHED
  | PROCESS_REQUEST
  | PROCESS_STARTED
  | PROCESS_FINISHED
  | PAYMENT_INSTRUMENT_GROUP
  | FORM_INPUT_VALIDATION
  | PAYMENT_ATTEMPT
  | CARD_NUMBER_FOCUSSED
  | EXPIRY_DATE_FOCUSSED
  | CVV_FOCUSSED
  | UPI_ID_FOCUSSED
  | MOBILE_NUMBER_ENTERED
  | SCREEN_RENDERED
  | API_APPS
  | MINIMIZE_MAXIMIZE
  | ON_RESUME
  | ON_PAUSE
  | ON_STOP
  | UPCOMING_SCREEN
  | ON_CLICK
  | EVAL
  | FIELD_FOCUSSED
  | FIELD_CANCELLED
  | PAYMENT_METHOD_QUICKPAY
  | CHECKBOX_CLICKED
  | PAYMENT_METHOD
  | NB_SEARCH_FOCUSED
  | NB_SEARCH_CANCELLED
  | PAYMENT_SOURCE_RESPONSE
  | CVV_CHANGED
  | EXPIRY_DATE_CHANGED
  | CARD_NUMBER_CHANGED
  | ORDER_STATUS
  | USER_ERROR
  | USER_WARNING
  | PAYMENT_DETAILS
  | NETWORK_CALL
  | LOADER
  | MOBILE_NUMBER_FOCUSSED
  | MOBILE_NUMBER_CHANGED
  | UPI_ID_CHANGED
  | DIALOG_RENDERED
  | BANK_SELECTED
  | OTP_FOCUSSED
  | OTP_CHANGED
  | PAYLOAD_ERROR
  | CURRENT_SCREEN
  | WALLET_SELECTED
  | LINK_WALLET
  | STORED_CARD_SELECTED
  | STORED_VPA_SELECTED
  | CARD_SELECTED
  | DIALOG_ACTION
  | PRERENDERED_SCREEN
  | VIES_FLOW
  | VIES_DETAILS
  | DEVICE_NAME
  | BROWSER_NAME
  | PAGE_RENDER_END
  | PAYMENT_PAGE_RENDERED_TIME
  | PAGE_EXIT
  | ON_EVENT
  | PAYMENT_SOURCE
  | JOS_LOADER_INIT
  | JOS_EVAL_START
  | JOS_INIT_EVENT
  | JOS_HYPER_APP_START
  | JOS_HYPER_SDK_EVAL_START
  | JOS_HYPER_SDK_MAIN
  | JOS_HYPER_SDK_CUSTOM_LOADER
  | PAYMENT_PAGE_RENDERED
  | CLIENT_IDENTIFIER
  | MORE_APPS_CLICK
  | SHOW_GENERIC
  | SHOW_PHONE_PE
  | SHOW_GOOGLE_PAY
  | GENERIC_INTENT_CLICK
  | THIRD_PARTY_SDK
  | PERMISSION
  | DEVICE_BINDING
  | VPA_ACCOUNTS
  | FETCH_ACCOUNTS
  | FETCH_PREFERED_ACCOUNTS
  | SET_UPI_PIN
  | ONBOARDING
  | ENROLLMENT
  | GET_SESSION_TOKEN
  | INAPP_PAY
  | LINK_ACCOUNTS
  | REFRESH_SESSION_TOKEN
  | UPI_MANAGEMENT
  | NPCI_CL
  | DEFAULT_PERMISSION
  | DELETE_VPA_ACCOUNT
  | MICROAPP
  | DEREGISTERED_ACCOUNT
  | LINKED_ACCOUNTS
  | BACKPRESS
  | OVERLAY_CLICK
  | ISSUE_SELECTED
  | CATEGORY_SELECTED
  | QUESTION_SELECTED
  | FULL_PAGE_GODEL
  | GODEL_ON_PAGE_STARTED
  | GODEL_ON_PAGE_FINISHED
  | END_OF_SCREEN
  | END_OF_SESSION
  | PAYMENT_STATUS_POPUP_OPEN
  | STATUS_SCREEN_OPEN_ORDER_STATUS
  | STATUS_SCREEN_EXIT_ORDER_STATUS
  | RETRY_PAYMENT_METHOD_TYPE
  | RETRY_PAYMENT_METHOD
  | RETRY_POLLING_DURATION
  | TIME_SPENT_STATUS_SCREEN
  | METHOD_ELIGIBILITY
  | ELIGIBILITY
  | CRED_PAY
  | PAYMENT_PAGE_READY
  | CARD_FINGERPRINT
  | USER_STATUS
  | GATEWAY_REFERENCE_ID_CHECK
  | CHANGE_UPI_PIN
  | TXN_DETAIL
  | ONBOARDING_INITIATED
  | ONBOARDING_ENDED
  | PAY_INITIATED
  | PAY_ENDED
  | ONBOARDING_SMS_PERMISSION
  | ONBOARDING_SIM_SELECTION
  | ONBOARDING_DEVICE_BINDING
  | ONBOARDING_FETCH_ACCOUNTS
  | ONBOARDING_LINK_ACCOUNTS
  | ONBOARDING_SET_UPI_PIN

instance encodeLabel :: Encode Label where
  encode = encode <<< show

instance showLabel :: Show Label where
  show = case _ of
    GODEL_ON_PAGE_STARTED -> "godel_on_page_started"
    GODEL_ON_PAGE_FINISHED -> "godel_on_page_finished"
    BUTTON_CLICKED -> "button_clicked"
    OTP_INFO -> "otp_info"
    SMS_INFO -> "sms_info"
    DETAILS -> "details"
    DECODE_ERROR -> "decode_error"
    ON_ACTIVITY_LIFE_CYCLE_EVENT -> "on_activity_life_cycle_event"
    CONFIG_FETCH -> "config_fetch"
    NETWORK -> "network"
    UPI_APPS -> "upi_apps"
    STATUS -> "status"
    PROCESS -> "process"
    INITIATE -> "initiate"
    AUTHENTICATION_STATUS -> "authentication_status"
    PRESTO_EXCEPTION -> "presto_exception"
    INITIATE_REQUEST -> "initiate_request"
    INITIATE_STARTED -> "initiate_started"
    INITIATE_FINISHED -> "initiate_finished"
    PROCESS_REQUEST -> "process_request"
    PROCESS_STARTED -> "process_started"
    PROCESS_FINISHED -> "process_finished"
    PAYMENT_INSTRUMENT_GROUP -> "payment_instrument_group"
    FORM_INPUT_VALIDATION -> "form_input_validation"
    PAYMENT_ATTEMPT -> "payment_attempt"
    CARD_NUMBER_FOCUSSED -> "card_number_focussed"
    EXPIRY_DATE_FOCUSSED -> "expiry_date_focussed"
    CVV_FOCUSSED -> "cvv_focussed"
    UPI_ID_FOCUSSED -> "upi_id_focussed"
    MOBILE_NUMBER_ENTERED -> "mobile_number_entered"
    SCREEN_RENDERED -> "screen_rendered"
    API_APPS -> "api_apps"
    MINIMIZE_MAXIMIZE -> "minimize_maximize"
    ON_RESUME -> "on_resume"
    ON_PAUSE -> "on_pause"
    ON_STOP -> "on_stop"
    UPCOMING_SCREEN -> "upcoming_screen"
    ON_CLICK -> "on_click"
    EVAL -> "eval"
    FIELD_FOCUSSED -> "field_focussed"
    FIELD_CANCELLED -> "field_cancelled"
    PAYMENT_METHOD_QUICKPAY -> "payment_method_quickpay"
    CHECKBOX_CLICKED -> "checkbox_clicked"
    PAYMENT_METHOD -> "payment_method"
    NB_SEARCH_FOCUSED -> "nb_search_focused"
    NB_SEARCH_CANCELLED -> "nb_search_cancelled"
    PAYMENT_SOURCE_RESPONSE -> "payment_source_response"
    CVV_CHANGED -> "cvv_changed"
    EXPIRY_DATE_CHANGED -> "expiry_date_changed"
    CARD_NUMBER_CHANGED -> "card_number_changed"
    ORDER_STATUS -> "order_status"
    USER_ERROR -> "user_error"
    USER_WARNING -> "user_warning"
    PAYMENT_DETAILS -> "payment_details"
    NETWORK_CALL -> "network_call"
    LOADER -> "loader"
    MOBILE_NUMBER_FOCUSSED -> "mobile_number_focussed"
    MOBILE_NUMBER_CHANGED -> "mobile_number_changed"
    UPI_ID_CHANGED -> "upi_id_changed"
    DIALOG_RENDERED -> "dialog_rendered"
    BANK_SELECTED -> "bank_selected"
    OTP_FOCUSSED -> "otp_focussed"
    OTP_CHANGED -> "otp_changed"
    PAYLOAD_ERROR -> "payload_error"
    CURRENT_SCREEN -> "current_screen"
    WALLET_SELECTED -> "wallet_selected"
    LINK_WALLET -> "link_wallet"
    STORED_CARD_SELECTED -> "stored_card_selected"
    STORED_VPA_SELECTED -> "stored_vpa_selected"
    CARD_SELECTED -> "card_selected"
    DIALOG_ACTION -> "dialog_action"
    PRERENDERED_SCREEN -> "prerendered_screen"
    VIES_FLOW -> "vies_flow"
    VIES_DETAILS -> "vies_details"
    DEVICE_NAME -> "device_name"
    BROWSER_NAME -> "browser_name"
    PAGE_RENDER_END -> "page_render_end"
    PAYMENT_PAGE_RENDERED_TIME -> "payment_page_rendered_time"
    PAGE_EXIT -> "page_exit"
    JOS_LOADER_INIT -> "jos_loader_init"
    JOS_EVAL_START -> "jos_eval_start"
    JOS_INIT_EVENT -> "jos_init_event"
    JOS_HYPER_APP_START -> "jos_hyper_app_start"
    JOS_HYPER_SDK_EVAL_START -> "jos_hyper_sdk_eval_start"
    JOS_HYPER_SDK_MAIN -> "jos_hyper_sdk_main"
    JOS_HYPER_SDK_CUSTOM_LOADER -> "jos_hyper_sdk_custom_loader"
    PAYMENT_PAGE_RENDERED -> "payment_page_rendered"
    CLIENT_IDENTIFIER -> "client_identifier"
    ON_EVENT -> "on_event"
    PAYMENT_SOURCE -> "payment_source"
    MORE_APPS_CLICK -> "more_apps_click"
    SHOW_GENERIC -> "show_generic"
    SHOW_PHONE_PE -> "show_phone_pe"
    SHOW_GOOGLE_PAY -> "show_google_pay"
    GENERIC_INTENT_CLICK -> "generic_intent_click"
    THIRD_PARTY_SDK -> "third_party_sdk"
    BACKPRESS -> "BACKPRESS"
    OVERLAY_CLICK -> "OVERLAY_CLICK"
    ISSUE_SELECTED -> "ISSUE_SELECTED"
    CATEGORY_SELECTED -> "CATEGORY_SELECTED"
    QUESTION_SELECTED -> "QUESTION_SELECTED"
    FULL_PAGE_GODEL -> "full_page_godel"
    END_OF_SCREEN -> "end_of_screen"
    END_OF_SESSION -> "end_of_session"
    PAYMENT_STATUS_POPUP_OPEN -> "payment_status_popup_open"
    STATUS_SCREEN_OPEN_ORDER_STATUS -> "status_screen_open_order_status"
    STATUS_SCREEN_EXIT_ORDER_STATUS -> "status_screen_exit_order_status"
    RETRY_PAYMENT_METHOD_TYPE -> "retry_payment_method_type"
    RETRY_PAYMENT_METHOD -> "retry_payment_method"
    RETRY_POLLING_DURATION -> "retry_polling_duration"
    TIME_SPENT_STATUS_SCREEN -> "time_spent_status_screen"
    PERMISSION -> "PERMISSION"
    DEVICE_BINDING -> "DEVICE_BINDING"
    VPA_ACCOUNTS -> "VPA_ACCOUNTS"
    FETCH_ACCOUNTS -> "FETCH_ACCOUNTS"
    FETCH_PREFERED_ACCOUNTS -> "FETCH_PREFERED_ACCOUNTS"
    SET_UPI_PIN -> "SET_UPI_PIN"
    ONBOARDING -> "ONBOARDING"
    ENROLLMENT -> "ENROLLMENT"
    GET_SESSION_TOKEN -> "GET_SESSION_TOKEN"
    INAPP_PAY -> "INAPP_PAY"
    LINK_ACCOUNTS -> "LINK_ACCOUNTS"
    REFRESH_SESSION_TOKEN -> "REFRESH_SESSION_TOKEN"
    UPI_MANAGEMENT -> "UPI_MANAGEMENT"
    NPCI_CL -> "NPCI_CL"
    DEFAULT_PERMISSION -> "DEFAULT_PERMISSION"
    MICROAPP -> "microapp"
    DELETE_VPA_ACCOUNT -> "DELETE_VPA_ACCOUNT"
    DEREGISTERED_ACCOUNT -> "DEREGISTERED_ACCOUNT"
    LINKED_ACCOUNTS -> "LINKED_ACCOUNTS"
    METHOD_ELIGIBILITY -> "method_eligibility"
    ELIGIBILITY -> "eligibility"
    CRED_PAY -> "cred_pay"
    PAYMENT_PAGE_READY -> "payment_page_ready"
    CARD_FINGERPRINT -> "card_fingerprint"
    USER_STATUS -> "user_status"
    GATEWAY_REFERENCE_ID_CHECK -> "gateway_reference_id_check"
    CHANGE_UPI_PIN -> "CHANGE_UPI_PIN"
    TXN_DETAIL -> "txn_detail"
    ONBOARDING_INITIATED -> "ONBOARDING_INITIATED"
    ONBOARDING_ENDED -> "ONBOARDING_ENDED"
    PAY_INITIATED -> "PAY_INITIATED"
    PAY_ENDED -> "PAY_ENDED"
    ONBOARDING_SMS_PERMISSION -> "ONBOARDING_SMS_PERMISSION"
    ONBOARDING_SIM_SELECTION -> "ONBOARDING_SIM_SELECTION"
    ONBOARDING_DEVICE_BINDING -> "ONBOARDING_DEVICE_BINDING"
    ONBOARDING_FETCH_ACCOUNTS -> "ONBOARDING_FETCH_ACCOUNTS"
    ONBOARDING_LINK_ACCOUNTS -> "ONBOARDING_LINK_ACCOUNTS"
    ONBOARDING_SET_UPI_PIN -> "ONBOARDING_SET_UPI_PIN"
