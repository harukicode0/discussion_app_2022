function issue_appear() {
  const ronten = document.getElementById("room-ronten");
  if (!ronten) return null;
  const room_issue = document.querySelector(".room-issues-right");
  const yazirusi = document.querySelector(".comment-yazirusi");
  ronten.addEventListener("click", function () {
    room_issue.classList.toggle("room-issues-right-set");
    yazirusi.classList.toggle("comment-yazirusi-set");
  });
}

window.addEventListener("load", issue_appear);
