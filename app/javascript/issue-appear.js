function issue_appear() {
  const ronten = document.getElementById("room-ronten");
  if (!ronten) return null;
  const room_issue = document.querySelector(".room-issues-right");
  ronten.addEventListener("click", function () {
    room_issue.classList.toggle("room-issues-right-set");
  });
}

window.addEventListener("load", issue_appear);
