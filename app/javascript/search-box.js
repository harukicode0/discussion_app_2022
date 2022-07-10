function search_box() {
  const search_box = document.querySelector("#search-box");
  if (!search_box) return null;
  const line = document.querySelector(".search-form");
  // ページをクリックした時の処理
  document.addEventListener("click", (e) => {
    // クリックした要素（"#search-box"）の親要素を判定している
    if (e.target.closest("#search-box")) {
      // "#search-box";がある場合の処理
      line.classList.remove("search-form");
      line.classList.add("is-fixed");
    } else {
      // "#search-box";がない場合の処理
      line.classList.add("search-form");
      line.classList.remove("is-fixed");
    }
  });
}

window.addEventListener("load", search_box);
