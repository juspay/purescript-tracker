const loopedFunction = function(){
  return loopedFunction
}
var newInterface = false;
const getTracker = function(){
  var trackerJson = window.JOS && window.JOS.tracker || {};
  if (typeof trackerJson.__trackLifeCycle == "function"){
    newInterface = true;
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
  if (typeof trackerJson._trackScreenWithPrev != "function"){
    trackerJson._trackScreenWithPrev = loopedFunction;
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

export const getValue = function(key){
  return function(value){
    if (value != undefined && value !== null) {
      var obj={};
      obj[key]=value;
      return obj;
    } else {
      return null;
    }
  }
}

export const addKeyValue = function(obj){
  return function(key){
    return function(value){
      obj[key]=value;
      return obj;
    }
  }
}

export const _trackLifeCycle = newInterface ? tracker.__trackLifeCycle : tracker._trackLifeCycle ;
export const _trackAction = newInterface ? tracker.__trackAction : tracker._trackAction ;
export const _trackApiCall = newInterface ? tracker.__trackApiCall : tracker._trackApiCall ;
export const _trackException = newInterface ? tracker.__trackException : tracker._trackException ;
export const _trackScreenWithLabel = newInterface ? tracker.__trackScreenWithLabel : tracker._trackScreenWithLabel ;
export const _trackScreenWithPrev = newInterface ? tracker.__trackScreenWithPrev : tracker._trackScreenWithPrev ;
export const _trackContext = newInterface ? tracker.__trackContext : tracker._trackContext ;
export const _trackActionEvent = newInterface ? tracker.__trackActionEvent : tracker._trackActionEvent ;
export const _trackContextEvent = newInterface ? tracker.__trackContextEvent : tracker._trackContextEvent ;
export const _trackScreenEvent = newInterface ? tracker.__trackScreenEvent : tracker._trackScreenEvent ;
export const _trackLifeCycleEvent = newInterface ? tracker.__trackContext : tracker._trackContext ;
export const _trackExceptionEvent = newInterface ? tracker.__trackExceptionEvent : tracker._trackExceptionEvent ;
