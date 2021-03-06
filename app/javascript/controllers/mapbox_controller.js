import { Controller } from "@hotwired/stimulus";
import mapboxgl from '!mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    interests: Array,
    users: Array,
  }

  connect() {

    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      maxZoom: 20,
      minZoom: 4,
      zoom: 14,
      style: 'mapbox://styles/theobcl/ckwkk2e5549jg14ockbokowue' // <-- you can use your own
    });




   this._addMarkersToMap();
   this._addInterestsToMap();
   this._fitMapToMarkers();
   this._localizeUsers();
   this._addUsersToMap();
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
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      const customMarker = document.createElement('div');
      customMarker.className = 'marker';
      customMarker.style.backgroundImage = `url('${marker.image_url}')`;
      customMarker.style.backgroundSize = 'contain';
      customMarker.style.width = '30px';
      customMarker.style.height = '30px';

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // add this
        .addTo(this.map);
    });
  }

  _addInterestsToMap() {
    this.interestsValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this

      const customMarker = document.createElement('div');
      customMarker.className = 'marker';
      customMarker.style.backgroundImage = `url('${marker.image_url}')`;
      customMarker.style.backgroundSize = 'contain';
      customMarker.style.width = '30px';
      customMarker.style.height = '30px';

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // add this
        .addTo(this.map);
    });
  }


  _addUsersToMap() {
    this.usersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this

      const customMarker = document.createElement('div');
      customMarker.className = 'marker';
      customMarker.style.backgroundImage = `url('${marker.image_url}')`;
      customMarker.style.backgroundSize = 'contain';
      customMarker.style.width = '30px';
      customMarker.style.height = '30px';
      customMarker.style.borderRadius = '50%';
      customMarker.style.border = '1px solid white';

      new mapboxgl.Marker(customMarker)
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

  // _addImageToMap() {
  //   this.map.on('load', () => {
  //     this.map.addSource("myImageSource", {
  //       "type": "image",
  //       "url": "https://res.cloudinary.com/julienmal/image/upload/v1637866363/images_ubyywk.jpg",
  //       "coordinates": [
  //         [2.377325, 48.866314],
  //         [2.384232, 48.86653],
  //         [2.384095, 48.862848],
  //         [2.373802, 48.862887],

  //       ]
  //     });

  //     this.map.addLayer({
  //       "id": "overlay",
  //       "source": "myImageSource",
  //       "type": "raster",
  //       "paint": {
  //         "raster-opacity": 1
  //       }
  //     });
  //   });
  // }
}
