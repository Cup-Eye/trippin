import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('accommodation_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
