import Rails from "@rails/ujs"

function initMap() {
  var mapComponent = document.getElementById("map")

  if(mapComponent !== null) {
    var map = new google.maps.Map(document.getElementById("map"), {
      center: {
        lat: -21.794100,
        lng: -48.174290
      },
      zoom: 7
    });

    Rails.ajax({
      url: mapComponent.dataset.pointsPath,
      dataType: "json",
      type: "get",
      success: function(data) {
        data.forEach(function(point) {
          var geocode = point.geocode
          var latLng = new google.maps.LatLng(geocode[0], geocode[1]);

          var marker = new google.maps.Marker({
            position: latLng,
            title: point.description
          })

          marker.setMap(map)
        });
      }
    })
  }
};

document.addEventListener("turbolinks:load", function() {
  initMap();
})
