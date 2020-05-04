module Tracker
  ( trackLifeCycle, trackLifeCycleFlow
  , trackAction, trackActionFlow
  , trackApiCall, trackApiCallFlow
  , trackException, trackExceptionFlow
  , trackScreenWithLabel, trackScreenWithLabelFlow
  , trackContext, trackContextFlow
  , trackScreen, trackScreenFlow
  , trackOverlay, trackOverlayFlow
  ) where

import Effect (Effect)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Labels (Label)
import Prelude (Unit, pure, show, unit, (<<<))
import Presto.Core.Types.Language.Flow (Flow, doAff)
import Types (Category, Level, Subcategory)

foreign import getValue :: String -> Foreign -> Foreign
foreign import trackScreen :: String -> Effect Unit
foreign import trackOverlay :: String -> Effect Unit
foreign import _trackLifeCycle :: String -> String -> String -> Foreign -> Effect Unit
foreign import _trackAction    :: String -> String -> String -> Foreign -> Effect Unit
foreign import _trackApiCall   :: String -> String -> String -> Int -> Int -> Int -> String -> String -> String  -> Effect Unit
foreign import _trackException :: String -> String -> String -> String -> String -> String -> Effect Unit
foreign import _trackScreenWithLabel :: String -> String -> String -> String -> Effect Unit
foreign import _trackContext   :: String -> String -> String -> Foreign -> Effect Unit

-- Interfaces for Effect

-- | trackLifeCycle [Category: Lifecycle], args: subcategory, level, label, key, value
trackLifeCycle :: Subcategory -> Level -> Label -> String -> Foreign -> Effect Unit
trackLifeCycle sub level label key value = _trackLifeCycle (show sub) (show level) (show label) (getValue key value)

-- | trackAction [Category: Action], args:  subcategory, level, label, key, value
trackAction :: Subcategory -> Level -> Label -> String -> Foreign -> Effect Unit
trackAction sub level label key value = _trackAction (show sub) (show level) (show label) (getValue key value)

-- | trackApiCall [Category: Api_call]
-- | args:  subcategory, level, label, start_time, end_time, status_code, response, url, payload
trackApiCall :: Subcategory -> Level -> Label -> Int -> Int -> Int -> String -> String -> String  -> Effect Unit
trackApiCall sub level label = _trackApiCall (show sub) (show level) (show label)

-- | trackException, args: category, subcategory, level, label, message, stacktrace
trackException :: Category -> Subcategory -> Level -> Label -> String -> String -> Effect Unit
trackException category sub level label = _trackException (show category) (show sub) (show level) (show label)

-- | trackScreenWithLabel [Category: Screen], args: subcategory, level, label, presentation_type
trackScreenWithLabel :: Subcategory -> Level -> Label -> String -> Effect Unit
trackScreenWithLabel sub level label = _trackScreenWithLabel (show sub) (show level) (show label)

-- | trackContext [Category: Context], args: subcategory, level, label, value
trackContext :: Subcategory -> Level -> Label -> Foreign -> Effect Unit
trackContext sub level label = _trackContext (show sub) (show level) (show label)

-- Interfaces for Flow

trackScreenFlow :: String -> Flow Unit
trackScreenFlow = effectToFlow <<< trackScreen
trackOverlayFlow :: String -> Flow Unit
trackOverlayFlow = effectToFlow <<< trackOverlay

trackLifeCycleFlow :: Subcategory -> Level -> Label -> String -> Foreign -> Flow Unit
trackLifeCycleFlow sub level label key = effectToFlow <<< trackLifeCycle sub level label key

trackActionFlow    :: Subcategory -> Level -> Label -> String -> Foreign -> Flow Unit
trackActionFlow sub level label key = effectToFlow <<< trackAction sub level label key

trackApiCallFlow :: Subcategory -> Level -> Label -> Int -> Int -> Int -> String -> String -> String  -> Flow Unit
trackApiCallFlow sub level label startTime endTime statusC response url = effectToFlow <<< trackApiCall sub level label startTime endTime statusC response url

trackExceptionFlow :: Category -> Subcategory -> Level -> Label -> String -> String -> Flow Unit
trackExceptionFlow category sub level label msg = effectToFlow <<< trackException category sub level label msg

trackScreenWithLabelFlow :: Subcategory -> Level -> Label -> String -> Flow Unit
trackScreenWithLabelFlow sub level label = effectToFlow <<< trackScreenWithLabel sub level label

trackContextFlow :: Subcategory -> Level -> Label -> Foreign -> Flow Unit
trackContextFlow sub level label = effectToFlow <<< trackContext sub level label

effectToFlow :: Effect Unit -> Flow Unit
effectToFlow = doAff <<< liftEffect

main :: Effect Unit
main = pure unit
