// const initUpdateNavbarOnScroll = () => {

//   const landingPage = document.querySelector('#landing-page');
//   if (landingPage) {
//     const navbar = document.querySelector('.navbar-lewagon');
//     navbar.classList.add('navbar-landing');
//     window.addEventListener('scroll', () => {
//       if (window.scrollY >= window.innerHeight) {
//         navbar.classList.add('navbar-lewagon-white');
//       } else {
//         navbar.classList.remove('navbar-lewagon-white');
//       }
//     });
//   }
// }

// export { initUpdateNavbarOnScroll };

const iconCard = document.querySelector('.icon-card')

if (iconCard) {
  iconCard.addEventListener('click', (event) => {
    console.log(document.querySelector('.dropdown-menu'))
    document.querySelector('#dropdown-settings').classList.toggle("show")
  })
}
