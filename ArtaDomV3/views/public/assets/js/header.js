document.addEventListener("DOMContentLoaded", function() {
  const currentUrl = window.location.href;
  const navLinks = document.querySelectorAll('.nav-menu ul li a');

  navLinks.forEach(link => {
    if (currentUrl.includes(link.getAttribute('href'))) {
      link.classList.add('active');
    }
  });
});