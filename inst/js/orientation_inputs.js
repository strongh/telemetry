var orientationBinding;

function handleOrientation(event) {
  var absolute = event.absolute;
  var alpha    = event.alpha;
  var beta     = event.beta;
  var gamma    = event.gamma;

  el = $("input.orientation");
  el.val(alpha + "," + beta + "," + gamma);
  el.trigger("change");
}

(function() {
orientationBinding = new Shiny.InputBinding();
$.extend(orientationBinding, {
  find: function(scope) {
    var components = $(scope).find("input.orientation");
    return components;
  },
  getValue: function(el) {
    var orientation = $(el).val().split(',');
    return {
      "alpha": parseFloat(orientation[0]),
      "beta": parseFloat(orientation[1]),
      "gamma": parseFloat(orientation[2])
    };
  },
  getType: function(el) {
    return  "telemetry.orientationWidget" ;
  },
  getRatePolicy: function() {
    return {
      "policy" : "throttle",
      "delay" : 500
      };
  },
  setValue: function(el, value) {
    $(el).text(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.orientationBinding", function(e) {
      callback(true);
    });
  },
  receiveMessage: function(el, data) {
    // NOOP
  },
  unsubscribe: function(el) {
    $(el).off(".orientationBinding");
  },
  initialize: function(el) {
    window.addEventListener('deviceorientation', handleOrientation);
  },
});
Shiny.inputBindings.register(orientationBinding);
})();
