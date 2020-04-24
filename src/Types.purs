module Types where

import Data.Generic.Rep.Show (genericShow)
import Data.Generic.Rep (class Generic)
import Data.String.Common (toLower)
import Foreign.Class (class Encode, encode)
import Prelude (class Show, show, (<<<))

data Subcategory
  = Android  | Ios | Web | Hypersdk | Microapp | User
  | System   | Network | Sdk | Screen | Device
  | Merchant | Payment | Miscellaneous

data Level
  = Info
  | Debug
  | Error
  | Critical
  | Warning
  | Exception

-- Instances

instance encodeSubcategory :: Encode Subcategory where
  encode = encode <<< toLower <<< show

derive instance subcategory :: Generic Subcategory _
instance showSubcategory :: Show Subcategory where
  show = genericShow

instance encodeLevel :: Encode Level where
  encode = encode <<< toLower <<< show

derive instance level :: Generic Level _
instance showLevel :: Show Level where
  show = genericShow