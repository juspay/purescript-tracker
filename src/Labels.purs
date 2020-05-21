module Tracker.Labels where

import Data.Generic.Rep.Show (genericShow)
import Data.Generic.Rep (class Generic)
import Data.String.Common (toLower)
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
instance encodeLabel :: Encode Label where
  encode = encode <<< show

derive instance label :: Generic Label _
instance showLabel :: Show Label where
  show = toLower <<< genericShow