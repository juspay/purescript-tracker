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
    if (typeof trackerJson._trackActionEvent != "function"){
        trackerJson._trackActionEvent = loopedFunction;
    }
    if (typeof trackerJson._trackContextEvent != "function"){
        trackerJson._trackContextEvent = loopedFunction;
    }
    if (typeof trackerJson._trackScreenEvent != "function"){
        trackerJson._trackScreenEvent = loopedFunction;
    }
    if (typeof trackerJson._trackLifeCycleEvent != "function"){
        trackerJson._trackLifeCycleEvent = loopedFunction;
    }
    if (typeof trackerJson._trackExceptionEvent != "function"){
        trackerJson._trackExceptionEvent = loopedFunction;
    }
    return trackerJson;
}
const tracker = getTracker();
window.trackerModule =  getTracker();

exports.getValue = function(key){
    return function(value){
        var obj={};
        obj[key]=value;
        return obj;
    }
}

exports.addKeyValue = function(obj){
    return function(key){
        return function(value){
            obj[key]=value;
            return obj;
        }
    }
}

exports._trackLifeCycle = tracker._trackLifeCycle
exports._trackAction = tracker._trackAction
exports._trackApiCall = tracker._trackApiCall
exports._trackException = tracker._trackException
exports._trackScreenWithLabel = tracker._trackScreenWithLabel
exports._trackContext = tracker._trackContext
exports._trackActionEvent = tracker._trackActionEvent
exports._trackContextEvent = tracker._trackContextEvent
exports._trackScreenEvent = tracker._trackScreenEvent
exports._trackLifeCycleEvent = tracker._trackContext
exports._trackExceptionEvent = tracker._trackExceptionEvent
