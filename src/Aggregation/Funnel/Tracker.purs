module Aggregation.Funnel.Tracker
  ( createFunnel
  , createFunnelFlow
  , putLog
  , putLogFlow
  )
  where

import Prelude (Unit, bind, negate, not, pure, unit, ($), (&&), (/=), (<<<))
import Foreign (Foreign)
import Data.String(null)
import Effect (Effect)
import Effect.Class (liftEffect)
import Tracker.Types as Types
import Presto.Core.Types.Language.Flow (Flow, doAff, getLogFields)
import Foreign.Object as Object

foreign import saveFunnel :: String -> Foreign -> String -> String -> Effect Boolean
foreign import saveJourney :: String -> String -> Effect String
foreign import getStageLevel :: String -> String -> Effect Int
foreign import getVariation :: String -> Effect String
foreign import getExperimentId :: String -> Effect String

foreign import trackAnalytics :: Types.FunnelLogs -> Object.Object Foreign -> String -> Effect Unit


effectToFlow :: forall a. Effect Unit -> Flow a Unit
effectToFlow = doAff <<< liftEffect

createFunnel :: String -> Foreign -> String -> String -> Effect Boolean
createFunnel = saveFunnel


createFunnelFlow :: forall a. String -> Foreign -> String -> String -> Flow a Boolean
createFunnelFlow name stages expId variation = doAff $ liftEffect $ saveFunnel name stages expId variation

getFunnelLogValue :: String -> String -> Int -> String -> String -> Types.FunnelLogs
getFunnelLogValue name stage stageLevel expId variation =
    Types.FunnelLogs $
        {
          "type": "funnel",
          type_name: name,
          stage,
          stage_level: stageLevel,
          experiment_id: expId,
          variation
        }

putLog :: String -> String -> Object.Object Foreign -> Effect Unit
putLog name stage json = do
    variation <- getVariation name
    expId <- getExperimentId name
    stageLevel <- getStageLevel name stage
    journey <- saveJourney name stage
    let logValue = getFunnelLogValue name journey stageLevel expId variation
    if not null journey && not null variation && not null expId && stageLevel /= -1 then
        trackAnalytics logValue json stage
        else pure unit


putLogFlow :: forall a. String -> String -> Flow a Unit
putLogFlow name stage = do
    variation <- doAff $ liftEffect $ getVariation name
    expId <- doAff $ liftEffect $ getExperimentId name
    stageLevel <- doAff $ liftEffect $ getStageLevel name stage
    journey <- doAff $ liftEffect $ saveJourney name stage
    json <- getLogFields
    let logValue = getFunnelLogValue name journey stageLevel expId variation
    if not null journey && not null variation && not null expId && stageLevel /= -1 then
        effectToFlow $ trackAnalytics logValue json stage
        else pure unit
