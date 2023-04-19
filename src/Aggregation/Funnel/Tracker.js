const loopedFunction = function(){
  return loopedFunction
}
var newInterface = false;
const getTracker = function(){
  var trackerJson = window.JOS && window.JOS.tracker || {};
  if (typeof trackerJson.__trackAnalytics == "function"){
    newInterface = true;
  }
  if (typeof trackerJson._trackAnalytics != "function"){
    trackerJson._trackAnalytics = loopedFunction;
  }
  return trackerJson;
}
const tracker = getTracker();
window.trackerModule =  getTracker();

var funnels = {};
var funnelJourney = {};


export const saveFunnel = function(funnelName) {
  return function(stages) {
    return function(experimentId) {
      return function(variation) {
        return function() {
          try {
            if(typeof funnels == "object" && typeof funnelJourney == "object") {
              if(Object.prototype.hasOwnProperty.call(funnels,funnelName) || Object.prototype.hasOwnProperty.call(funnelJourney,funnelName)) {
                return false;
              }
              funnels[funnelName] = {
                experimentId: experimentId,
                variation: variation,
                stages: stages
              };
              funnelJourney[funnelName] = "";
              return true;
            }
          } catch(err) {
            return false;
          }

        }
      }
    }
  }
}

export const saveJourney = function(funnelName) {
  return function(stage) {
    return function() {
      try {
        if(typeof funnelJourney == "object"
                    && Object.prototype.hasOwnProperty.call(funnelJourney,funnelName)
                    && typeof funnelJourney[funnelName] == "string") {
          if(funnelJourney[funnelName].length == 0) {
            funnelJourney[funnelName] += stage;
            return funnelJourney[funnelName];
          }
          funnelJourney[funnelName] += "/" + stage;
          return funnelJourney[funnelName];
        }
        return "";
      } catch(err) {
        return "";
      }

    }
  }
}

export const getStageLevel = function(funnelName) {
  return function(stage) {
    return function() {
      try {
        if(typeof funnels[funnelName].stages[stage] == "number") {
          return funnels[funnelName].stages[stage];
        }

        return -1;

      } catch(err) {
        return -1;
      }
    }
  }
}

export const getVariation = function(funnelName) {
  return function() {
    try {
      if(typeof funnels[funnelName].variation == "string") {
        return funnels[funnelName].variation;
      }

      return "";
    } catch(err) {
      return "";
    }
  }
}

export const getExperimentId = function(funnelName) {
  return function() {
    try {
      if(typeof funnels[funnelName].experimentId == "string") {
        return funnels[funnelName].experimentId;
      }

      return "";
    } catch(err) {
      return "";
    }
  }
}

export const trackAnalytics = newInterface ? tracker.__trackAnalytics: tracker._trackAnalytics;
