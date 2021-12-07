import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports

import mapboxgl from 'mapbox-gl';
const mapElement = document.getElementById('map');

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding:70, maxZoom: 15 });
};

const initMapbox = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const markers = JSON.parse(mapElement.dataset.markers);

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [markers[0].lng, markers[0].lat],
    zoom: 13
  });


  markers.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundSize = 'cover';
    element.style.width = '35px';
    element.style.height = '50px';
    if (marker.status) {
      element.style.backgroundImage = `url('https://res.cloudinary.com/dg2an4buq/image/upload/v1638864481/green-dark-pin_n1y4ku.png')`;
    } else {
      element.style.backgroundImage = `url('https://res.cloudinary.com/dg2an4buq/image/upload/v1638864232/red-pin_qi3h38.png')`;
    }

  new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(new mapboxgl.Popup().setHTML(marker.info_window))
    .addTo(map);
});

  map.addControl(
    new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      // When active the map will receive updates to the device's location as it changes.
      trackUserLocation: true,
      // Draw an arrow next to the location dot to indicate which direction the device is heading.
      showUserHeading: true
    })
  );

  fitMapToMarkers(map, markers);
};

export { initMapbox };
