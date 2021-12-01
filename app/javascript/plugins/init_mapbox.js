import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports

import mapboxgl from 'mapbox-gl';
const mapElement = document.getElementById('map');

const addMarkers = (map, markers) => {

};

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
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  });

fitMapToMarkers(map, markers);

};

export { initMapbox };
