import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Want a pet?", "Just search. Get one. Enjoy!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
