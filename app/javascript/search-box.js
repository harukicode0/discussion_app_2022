function search_box() {
  const search_box = document.querySelector("#search-box");
  if (!search_box) return null;
  const target = document.querySelector(".search-form");
  search_box.addEventListener("click", function () {
    target.classList.remove("search-form");
    target.classList.add("is-fixed");
  });
}

window.addEventListener("load", search_box);
