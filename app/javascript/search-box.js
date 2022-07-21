function search_box() {
  const line = document.querySelector(".search-form");
  if (!line) return null;
  // ページをクリックした時の処理
  document.addEventListener("click", (e) => {
    // クリックした要素【document】の親要素（"#search-box"）を判定している
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
