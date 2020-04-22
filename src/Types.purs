module Types where

import Prelude

import Effect (Effect)
import Foreign.Class (class Encode, encode)
import Data.Generic.Rep.Show (genericShow)
import Data.Generic.Rep (class Generic)

data Subcategory
  = ANDROID  | IOS | WEB | HYPERSDK | MICROAPP | USER
  | SYSTEM   | NETWORK | SDK | SCREEN | DEVICE
  | MERCHANT | PAYMENT | MISCELLANEOUS

data Level
  = INFO
  | DEBUG
  | ERROR
  | CRITICAL
  | WARNING
  | EXCEPTION

-- Instances

instance encodeSubcategory :: Encode Subcategory where
  encode ANDROID        = encode "android"
  encode IOS            = encode "ios"
  encode WEB            = encode "web"
  encode HYPERSDK       = encode "hypersdk"
  encode MICROAPP       = encode "microapp"
  encode USER           = encode "user"
  encode SYSTEM         = encode "system"
  encode NETWORK        = encode "network"
  encode SDK            = encode "sdk"
  encode SCREEN         = encode "screen"
  encode DEVICE         = encode "device"
  encode MERCHANT       = encode "merchant"
  encode PAYMENT        = encode "payment"
  encode MISCELLANEOUS  = encode "miscellaneous"

derive instance subcategory :: Generic Subcategory _
instance showSubcategory :: Show Subcategory where
  show = genericShow

instance encodeLevel :: Encode Level where
  encode INFO       = encode "INFO"
  encode DEBUG      = encode "DEBUG"
  encode ERROR      = encode "ERROR"
  encode EXCEPTION = encode "EXCEPTION"
  encode WARNING    = encode "WARNING"
  encode CRITICAL   = encode "CRTICAL"

derive instance level :: Generic Level _
instance showLevel :: Show Level where
  show = genericShow