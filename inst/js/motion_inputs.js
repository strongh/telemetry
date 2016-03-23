var motionBinding;

function handleMotionEvent(event) {
  var x = event.accelerationIncludingGravity.x;
  var y = event.accelerationIncludingGravity.y;
  var z = event.accelerationIncludingGravity.z;

  el = $("input.motion");
  el.val(x + "," + y + "," + z);
  el.trigger("change");
}

(function() {
motionBinding = new Shiny.InputBinding();
$.extend(motionBinding, {
  find: function(scope) {
    var components = $(scope).find("input.motion");
    return components;
  },
  getValue: function(el) {
    var motion = $(el).val().split(',');
    return {
      "x": parseFloat(motion[0]),
      "y": parseFloat(motion[1]),
      "z": parseFloat(motion[2])
    };
  },
  getRatePolicy: function() {
    return {
      "policy" : "throttle",
      "delay" : 500
      };
  },
  getType: function(el) {
    return  "telemetry.motionWidget" ;
  },
  setValue: function(el, value) {
    $(el).text(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.motionBinding", function(e) {
      callback(true);
    });
  },
  receiveMessage: function(el, data) {
    // NOOP
  },
  unsubscribe: function(el) {
    $(el).off(".motionBinding");
  },
  initialize: function(el) {
    window.addEventListener("devicemotion", handleMotionEvent, true);
  },
});
Shiny.inputBindings.register(motionBinding);
})();
