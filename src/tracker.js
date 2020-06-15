const loopedFunction = function(){
    return loopedFunction
}
const getTracker = function(){
    var trackerJson = window.JOS && window.JOS.tracker || {};
    if (typeof trackerJson.trackEvent != "function"){
        trackerJson.trackEvent = loopedFunction;
    }
    if (typeof trackerJson.trackApi != "function"){
        trackerJson.trackApi = loopedFunction;
    }
    if (typeof trackerJson.trackEventInfo != "function"){
        trackerJson.trackEventInfo = loopedFunction;
    }
    if (typeof trackerJson.trackEventDebug != "function"){
        trackerJson.trackEventDebug = loopedFunction;
    }
    if (typeof trackerJson.trackExceptionCritical != "function"){
        trackerJson.trackExceptionCritical = loopedFunction;
    }
    if (typeof trackerJson.trackExceptionWarning != "function"){
        trackerJson.trackExceptionWarning = loopedFunction;
    }
    if (typeof trackerJson.trackExceptionError != "function"){
        trackerJson.trackExceptionError = loopedFunction;
    }
    if (typeof trackerJson.trackMicroAppVerison != "function"){
        trackerJson.trackMicroAppVerison = loopedFunction;
    }
    if (typeof trackerJson.trackScreen != "function"){
        trackerJson.trackScreen = loopedFunction;
    }
    if (typeof trackerJson.trackOverlay != "function"){
        trackerJson.trackOverlay = loopedFunction;
    }
    if (typeof trackerJson.trackUserError != "function"){
        trackerJson.trackUserError = loopedFunction;
    }
    if (typeof trackerJson.trackPageLoad != "function"){
        trackerJson.trackPageLoad = loopedFunction;
    }
    return trackerJson;
}
const tracker = getTracker();
window.trackerModule =  getTracker();

exports.trackEvent = tracker.trackEventInfo
exports.trackApi = tracker.trackApi
exports.trackEventInfo = tracker.trackEventInfo
exports.trackEventDebug = tracker.trackEventDebug
exports.trackExceptionCritical = tracker.trackExceptionCritical
exports.trackExceptionWarning = tracker.trackExceptionWarning
exports.trackExceptionError = tracker.trackExceptionError
exports.trackMicroAppVerison = tracker.trackMicroAppVerison
exports.trackScreen = tracker.trackScreen
exports.trackOverlay = tracker.trackOverlay
exports.trackUserError = tracker.trackUserError
exports.trackPageLoad = tracker.trackPageLoad