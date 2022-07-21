function room_dropdown() {
  const info = document.getElementById("room-info");
  if (!info) return null;
  const btn = document.querySelector(".room-info-top");
  document.addEventListener("click", (e) => {
    if (e.target.closest("#room-info-dropdown-btn")) {
      info.classList.add("room-info-set");
      btn.classList.add("room-info-top-set");
    } else {
      info.classList.remove("room-info-set");
      btn.classList.remove("room-info-top-set");
    }
  });
}

window.addEventListener("load", room_dropdown);
