module Labels where

import Data.Generic.Rep.Show (genericShow)
import Data.Generic.Rep (class Generic)
import Data.String.Common (toLower)
import Foreign.Class (class Encode, encode)
import Prelude (class Show, show, (<<<))

data Label
  = BUTTON_CLICKED
  | OTP_INFO
  | DETAILS
  | DECODE_ERROR
  | ON_ACTIVITY_LIFE_CYCLE_EVENT
  | CONFIG_FETCH
  | NETWORK
  | UPI_APPS
  | STATUS
  | PROCESS_RESPONSE
  | PRESTO_EXCEPTION

instance encodeLabel :: Encode Label where
  encode = encode <<< toLower <<< show

derive instance label :: Generic Label _
instance showLabel :: Show Label where
  show = genericShow