function position_color() {
  const position = document.querySelector(".position-open-users");
  if (!position) return null;
  // 取得した要素の文字列で判定を行う
  const text = position.textContent;
  const parent = position.parentElement;
  const post_btn = document.querySelector(".comment_bottom_r");
  if (text == "Yes") {
    parent.style.borderBottom = "2px solid var(--agree-color)";
    parent.style.color = "var(--deep-agree-color)";
    post_btn.style.backgroundColor = "var(--agree-color)";
  } else if (text == "No") {
    parent.style.borderBottom = "2px solid var(--disagree-color)";
    parent.style.color = "var(--deep-disagree-color)";
    post_btn.style.backgroundColor = "var(--deep-disagree-color)";
  }
}

window.addEventListener("load", position_color);
