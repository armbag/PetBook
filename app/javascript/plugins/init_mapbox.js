import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css'
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';



let markersData
let apiKey
let mapELement
let map

const fitMapToMarkers = (markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMap = () => {
  mapELement = document.querySelector('#map')
  if (mapELement == null)
    return

  markersData = JSON.parse(mapELement.dataset.markers)
  console.log(markersData)
  console.log(mapELement.dataset.mapboxApiKey)
  console.log("pk.eyJ1IjoiYXJtZW4wMDAiLCJhIjoiY2p2emNhc2NxMDVwMzN5cmtwcmRyN3VtaSJ9.xsOSTfL2d_-rZR1LKfETTg")
  apiKey = mapELement.dataset.mapboxApiKey
  mapboxgl.accessToken = apiKey

  map = new mapboxgl.Map({
    container: mapELement,
    style: 'mapbox://styles/mapbox/streets-v9'
  })


  markersData.forEach((markerData, index) => {
    const popup = new mapboxgl.Popup().setHTML(markerData.infoWindow); // add this
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${markerData.image_url}')`;
    element.style.backgroundSize = 'cover';
    element.style.width = '20px';
    element.style.height = '25px';

    new mapboxgl.Marker()
    .setLngLat([markerData.lng, markerData.lat])
    .setPopup(popup)
    .addTo(map);
  })

  fitMapToMarkers(markersData)
  map.addControl(new MapboxGeocoder({ accessToken: apiKey }));

}

export default initMap
