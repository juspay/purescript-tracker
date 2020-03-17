const trackerJson = JOS.tracker || {};
const loopedFunction = function(){
    return loopedFunction
}
const tracker = new Proxy(trackerJson,{
    get : function(){
        return loopedFunction
    }
});

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