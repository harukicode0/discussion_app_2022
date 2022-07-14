function position_color() {
  const position = document.querySelector(".position-open-users");
  if (!position) return null;
  // 取得した要素の文字列で判定を行う
  const text = position.textContent;
  const parent = position.parentElement;
  const post_btn = document.querySelector(".comment_bottom_r");
  if (text == "Yes") {
    parent.style.backgroundColor = "var(--agree-color)";
    post_btn.style.backgroundColor = "var(--agree-color)";
  } else if (text == "No") {
    parent.style.backgroundColor = "var(--disagree-color)";
    post_btn.style.backgroundColor = "var(--disagree-color)";
  }
}

window.addEventListener("load", position_color);
