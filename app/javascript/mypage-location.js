function mypage_current_page_location() {
  const links = document.querySelectorAll(".mypage-top-link");
  // const links = document.querySelectorAll(".mypage-top-a");

  if (!links) return null;
  links.forEach(function (item) {
    // ページのURLを読み込む
    const url = location.href;
    // let item_url = item.getElementsByTagName("a")[0].getAttribute("href");
    if (url == item.href) {
      const parent = item.parentElement;
      parent.classList.add("mypage-top-a-set");
    }
  });
}

window.addEventListener("load", mypage_current_page_location);
