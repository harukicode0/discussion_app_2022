function comment_bigger() {
  const comment_box = document.querySelector(".comment_box");
  if (!comment_box) return null;
  // ページをクリックした時の処理
  document.addEventListener("click", (e) => {
    // クリックした要素【document】の親要素（"#search-box"）を判定している
    if (e.target.closest(".comment_box")) {
      // ".comment_box";がある場合の処理、つまりcomment_boxをクリックしている
      comment_box.classList.add("comment_box_set");
    } else {
      // ".comment-box";がない場合の処理
      comment_box.classList.remove("comment_box_set");
    }
  });
}

window.addEventListener("load", comment_bigger);
