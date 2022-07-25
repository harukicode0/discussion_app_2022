function menu_dropdown() {
  const menu = document.querySelector(".lists-right-buger");
  if (!menu) return null;
  const lists = document.querySelector(".lists-right");
  menu.addEventListener("click", (e) => {
    lists.classList.toggle("lists-right-buger-set");
  });
}

window.addEventListener("load", menu_dropdown);
