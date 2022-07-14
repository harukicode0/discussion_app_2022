function sort_current_location() {
  const links = document.querySelectorAll(".sort-btn");
  if (!links) return null;
  const url = location.href;
  links.forEach(function (item) {
    if (url == item.href) {
      item.classList.add("sort-btn-set");
    }
  });
}

window.addEventListener("load", sort_current_location);
