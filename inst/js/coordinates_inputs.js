var coordinatesBinding;
function geoFindMe() {
  var output = document.getElementById("out");

  if (!navigator.geolocation){
    // TODO: return NA or NULL
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    el = $("input.coordinates");

    el.val(latitude + "," + longitude);
    el.trigger("change");
  }

  function error() {
    console.log("Unable to retrieve your location");
  }

  navigator.geolocation.getCurrentPosition(success, error);
}

(function() {


coordinatesBinding = new Shiny.InputBinding();
$.extend(coordinatesBinding, {
  find: function(scope) {
    var components = $(scope).find("input.coordinates");
    return components;
  },
  getValue: function(el) {
    var coords = $(el).val().split(',');
    return {"lat": parseFloat(coords[0]),
            "lon": parseFloat(coords[1])};
  },
  getType: function(el) {
    return  "telemetry.coordinatesWidget" ;
  },
  setValue: function(el, value) {
    $(el).text(value);
  },
  subscribe: function(el, callback) {
    $(el).on("change.coordinatesBinding", function(e) {
      callback();
    });
  },
  receiveMessage: function(el, data) {
    // NOOP
  },
  unsubscribe: function(el) {
    $(el).off(".coordinatesBinding");
  },
  initialize: function(el) {
   geoFindMe();
  },
});

Shiny.inputBindings.register(coordinatesBinding);
})();
