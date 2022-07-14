function mypage_current_page_location() {
  const links = document.querySelectorAll(".mypage-top-link");
  if (!links) return null;
  const url = location.href;
  links.forEach(function (item) {
    // ページのURLを読み込む
    if (url == item.href) {
      const parent = item.parentElement;
      parent.classList.add("mypage-top-a-set");
    }
  });
}

window.addEventListener("load", mypage_current_page_location);
