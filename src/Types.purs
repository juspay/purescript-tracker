module Tracker.Types where

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.String.Common (toLower)
import Foreign.Class (class Encode, encode)
import Prelude

data LIFECYCLE' = LIFECYCLE
data ACTION' = ACTION
data API_CALL' = API_CALL
data SCREEN' = SCREEN
data CONTEXT' = CONTEXT

data Lifecycle = Android | Ios | Web | Hypersdk | Microapp
data Action = User | System
data ApiCall = Network | Sdk | AC_Microapp | Management
data Screen = Screen
data Context = Device | Merchant | C_Hypersdk | C_Network | Payment | C_User

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
  show AC_Microapp = "microapp"
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
  show C_Hypersdk = "hypersdk"
  show C_Network = "network"
  show C_User = "user"
  show x = toLower $ genericShow x

derive instance level :: Generic Level _
instance showLevel :: Show Level where
  show = toLower <<< genericShow
