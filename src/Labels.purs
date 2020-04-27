module Labels where

import Data.Generic.Rep.Show (genericShow)
import Data.Generic.Rep (class Generic)
import Data.String.Common (toLower)
import Foreign.Class (class Encode, encode)
import Prelude (class Show, show, (<<<))

data Label
  = Otp_detected -- | On detection of OTP

instance encodeLabel :: Encode Label where
  encode = encode <<< toLower <<< show

derive instance label :: Generic Label _
instance showLabel :: Show Label where
  show = genericShow