import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const element = document.getElementById('banner-typed-text')
  if (element) {
    new Typed('#banner-typed-text', {
      strings: ["Want a pet?", "Just search. Get one. Enjoy!"],
      typeSpeed: 25,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
