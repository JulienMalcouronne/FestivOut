import { Controller } from "@hotwired/stimulus";
import mapboxgl from '!mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    interests: Array,
  }

  connect() {

    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      maxZoom: 20,
      minZoom: 4,
      zoom: 14,
      style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb' // <-- you can use your own
    });



   this._addMarkersToMap();
   this._addInterestsToMap();
   this._fitMapToMarkers();
   this._localizeUsers();
    this._addImageToMap();

    this.map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }));
  }
  _localizeUsers() {
    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
      })
    );
  }
  _addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // add this
        .addTo(this.map);
    });
  }
  _addInterestsToMap() {
    this.interestsValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // add this
        .addTo(this.map);
    });
  }

  _fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  _addImageToMap() {
    this.map.on('load', () => {
      this.map.addSource("myImageSource", {
        "type": "image",
        "url": "https://res.cloudinary.com/julienmal/image/upload/v1637778675/outlogo_b8qdpy.png",
        "coordinates": [
          [2.382219, 48.866724],
          [2.378068, 48.866037],
          [2.378218, 48.864278],
          [2.381888, 48.863838],
        ]
      });

      this.map.addLayer({
        "id": "overlay",
        "source": "myImageSource",
        "type": "raster",
        "paint": {
          "raster-opacity": 1
        }
      });
    });
  }
}
