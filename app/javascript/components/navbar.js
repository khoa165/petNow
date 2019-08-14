const initUpdateNavbarOnScroll = () => {
  const navbar = document.getElementById("navbar");
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= (0.8 * window.innerHeight)) {
        navbar.classList.add('scrolled');
      } else {
        navbar.classList.remove('scrolled');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
