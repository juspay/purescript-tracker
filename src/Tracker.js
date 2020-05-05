const loopedFunction = function(){
    return loopedFunction
}
const getTracker = function(){
    var trackerJson = JOS.tracker || {};
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
    if (typeof trackerJson._trackContext != "function"){
        trackerJson._trackContext = loopedFunction;
    }
    return trackerJson;
}
const tracker = getTracker();
window.trackerModule =  getTracker();

exports.getValue = function(key, value) {
    var keyValue = {key: value};
    return keyValue;
}

exports._trackLifeCycle = tracker._trackLifeCycle
exports._trackAction = tracker._trackAction
exports._trackApiCall = tracker._trackApiCall
exports._trackException = tracker._trackException
exports._trackScreenWithLabel = tracker._trackScreenWithLabel
exports._trackContext = tracker._trackContext