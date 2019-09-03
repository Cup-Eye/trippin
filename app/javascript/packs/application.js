
import "bootstrap";

import { initUpdateNavbarOnScroll } from '../components/navbar';
// initUpdateNavbarOnScroll();

// import "../plugins/flatpickr";
import { initAutocomplete } from '../plugins/init_autocomplete';

//API calls
initAutocomplete();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initAllMaps } from '../plugins/init_mapbox';

initAllMaps();

