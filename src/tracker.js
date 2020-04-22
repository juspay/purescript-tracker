const loopedFunction = function(){
    return loopedFunction
}
const getTracker = function(){
    var trackerJson = JOS.tracker || {};
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
    if (typeof trackerJson._trackLifeCycle != "function"){
        trackerJson._trackLifeCycle = loopedFunction;
    }
    if (typeof trackerJson._trackAction != "function"){
        trackerJson._trackAction = loopedFunction;
    }
    if (typeof trackerJson._trackApiCall != "function"){
        trackerJson._trackApiCall = loopedFunction;
    }
    if (typeof trackerJson._trackException != "function"){
        trackerJson._trackException = loopedFunction;
    }
    if (typeof trackerJson._trackScreenWithLabel != "function"){
        trackerJson._trackScreenWithLabel = loopedFunction;
    }
    // if (typeof trackerJson.trackMerchantContext != "function"){
    //     trackerJson.trackMerchantContext = loopedFunction;
    // }
    // if (typeof trackerJson.trackHypersdkContext != "function"){
    //     trackerJson.trackHypersdkContext = loopedFunction;
    // }
    // if (typeof trackerJson.trackPaymentContext != "function"){
    //     trackerJson.trackPaymentContext = loopedFunction;
    // }
    // if (typeof trackerJson.trackUserContext != "function"){
    //     trackerJson.trackUserContext = loopedFunction;
    // }
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
exports._trackLifeCycle = tracker._trackLifeCycle
exports._trackAction = tracker._trackAction
exports._trackApiCall = tracker._trackApiCall
exports._trackException = tracker._trackException
exports._trackScreenWithLabel = tracker._trackScreenWithLabel
// exports.trackMerchantContext = tracker.trackMerchantContext
// exports.trackHypersdkContext = tracker.trackHypersdkContext
// exports.trackPaymentContext = tracker.trackPaymentContext
// exports.trackUserContext = tracker.trackUserContext