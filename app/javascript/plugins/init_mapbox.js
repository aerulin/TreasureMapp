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
const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v11',
  center: [8.224471999999992, 46.8155135],
  zoom: 5
});

const markers = JSON.parse(mapElement.dataset.markers);

  markers.forEach((marker) => {

  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('https://res.cloudinary.com/dg2an4buq/image/upload/v1638797470/sinan-portrait-SITE_nhsfld.png')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '25px';
  element.style.height = '25px';
  new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
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
