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
import Prelude (Unit, pure, show, unit, ($))
import Presto.Core.Types.Language.Flow (Flow, doAff)
import Types (Level, Subcategory)

foreign import trackScreen :: String -> Effect Unit
foreign import trackOverlay :: String -> Effect Unit
foreign import _trackLifeCycle :: String -> String -> String -> Foreign -> Effect Unit
foreign import _trackAction    :: String -> String -> String -> Foreign -> Effect Unit
foreign import _trackApiCall   :: String -> String -> String -> Int -> Int -> String -> String  -> Effect Unit
foreign import _trackException :: String -> String -> String -> String -> String -> Effect Unit
foreign import _trackScreenWithLabel :: String -> String -> String -> String -> Effect Unit
foreign import _trackContext   :: String -> String -> String -> Foreign -> Effect Unit

-- Interfaces for Effect

trackLifeCycle :: Subcategory -> Level -> Label -> Foreign -> Effect Unit
trackLifeCycle sub level label value = _trackLifeCycle (show sub) (show level) (show label) value

trackAction :: Subcategory -> Level -> Label -> String -> Foreign -> Effect Unit
trackAction sub level label key value = _trackAction (show sub) (show level) (show label) value

trackApiCall :: Subcategory -> Level -> Label -> Int -> Int -> String -> String  -> Effect Unit
trackApiCall sub level label startTime endTime response payload = _trackApiCall (show sub) (show level) (show label) startTime endTime response payload

trackException :: Subcategory -> Level -> Label -> String -> String -> Effect Unit
trackException sub level label msg stacktrace = _trackException (show sub) (show level) (show label) msg stacktrace

trackScreenWithLabel :: Subcategory -> Level -> Label -> String -> Effect Unit
trackScreenWithLabel sub level label presentation_type = _trackScreenWithLabel (show sub) (show level) (show label) presentation_type

trackContext :: Subcategory -> Level -> Label -> Foreign -> Effect Unit
trackContext sub level label value = _trackContext (show sub) (show level) (show label) value

-- Interfaces for Flow

trackScreenFlow :: String -> Flow Unit
trackScreenFlow name = doAff $ liftEffect $ trackScreen name
trackOverlayFlow :: String -> Flow Unit
trackOverlayFlow name = doAff $ liftEffect $ trackOverlay name
trackLifeCycleFlow :: Subcategory -> Level -> Label -> Foreign -> Flow Unit
trackLifeCycleFlow sub level label value = doAff $ liftEffect $ _trackLifeCycle (show sub) (show level) (show label) value

trackActionFlow    :: Subcategory -> Level -> Label -> Foreign -> Flow Unit
trackActionFlow sub level label value = doAff $ liftEffect $ _trackAction (show sub) (show level) (show label) value

trackApiCallFlow   :: Subcategory -> Level -> Label -> Int -> Int -> String -> String  -> Flow Unit
trackApiCallFlow sub level label startTime endTime response payload = doAff $ liftEffect $ _trackApiCall (show sub) (show level) (show label) startTime endTime response payload

trackExceptionFlow :: Subcategory -> Level -> Label -> String -> String -> Flow Unit
trackExceptionFlow sub level label msg stacktrace = doAff $ liftEffect $ _trackException (show sub) (show level) (show label) msg stacktrace

trackScreenWithLabelFlow :: Subcategory -> Level -> Label -> String -> Flow Unit
trackScreenWithLabelFlow sub level label presentation_type = doAff $ liftEffect $ _trackScreenWithLabel (show sub) (show level) (show label) presentation_type

trackContextFlow :: Subcategory -> Level -> Label -> Foreign -> Flow Unit
trackContextFlow sub level label value = doAff $ liftEffect $ _trackContext (show sub) (show level) (show label) value

main :: Effect Unit
main = pure unit
