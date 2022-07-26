function room_dropdown() {
  const btn = document.querySelector(".sort-top");
  if (!btn) return null;
  const sort = document.querySelector(".sort-lists");
  const sankaku = document.querySelector(".sort-sankaku");
  btn.addEventListener("click", (e) => {
    if (sort.classList.contains("sort-lists-set")) {
      sort.classList.remove("sort-lists-set");
      sankaku.innerHTML = "▼";
    } else {
      sort.classList.add("sort-lists-set");
      sankaku.innerHTML = "▲";
    }
  });
}

window.addEventListener("load", room_dropdown);
