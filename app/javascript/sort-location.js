function sort_current_location() {
  const links = document.querySelectorAll(".sort-btn");
  if (!links) return null;
  const url = location.href;
  links.forEach(function (item) {
    let result = url.indexOf(item.form.action);
    if (result == 0) {
      console.log("ok");
      item.classList.add("sort-btn-set");
    }
  });
}

window.addEventListener("load", sort_current_location);
// ソートのカラーを変更し、どのソートが適用されているかわかるようにするため
