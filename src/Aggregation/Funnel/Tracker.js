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


exports["saveFunnel"] = function(funnelName) {
    return function(stages) {
        return function(experimentId) {
            return function(variation) {
                return function() {
                    try {
                        if(typeof funnels == "object" && typeof funnelJourney == "object") {
                            if(funnels.hasOwnProperty(funnelName) || funnelJourney.hasOwnProperty(funnelName)) {
                                return false;
                            }
                            funnels[funnelName] = {
                                experimentId,
                                variation,
                                stages
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

exports["saveJourney"] = function(funnelName) {
    return function(stage) {
        return function() {
            try {
                if(typeof funnelJourney == "object" 
                    && funnelJourney.hasOwnProperty(funnelName) 
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

exports["getStageLevel"] = function(funnelName) {
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

exports["getVariation"] = function(funnelName) {
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

exports["getExperimentId"] = function(funnelName) {
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

exports.trackAnalytics = newInterface ? tracker.__trackAnalytics: tracker._trackAnalytics;
