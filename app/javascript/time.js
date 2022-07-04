function countdown() {
  const now = new Date(); //今の時間
  const deadlines = document.getElementsByClassName("deadline"); //deadlineを取得
  if (!deadlines) return null;
  for (let i = 0; i < deadlines.length; i++) {
    const differ = new Date(deadlines[i].textContent) - now; //3日後まであと何ミリ秒か
    const differ_id = deadlines[i].getAttribute("id");
    const sec = Math.floor(differ / 1000) % 60;
    const min = Math.floor(differ / 1000 / 60) % 60;
    const hour = Math.floor(differ / 1000 / 60 / 60);

    document.getElementById("hour" + differ_id).textContent = String(
      hour
    ).padStart(2, "0"); //一桁になった時0がつくように
    document.getElementById("min" + differ_id).textContent = String(
      min
    ).padStart(2, "0");
    document.getElementById("sec" + differ_id).textContent = String(
      sec
    ).padStart(2, "0");
  }
  setTimeout(countdown, 1000);
}

window.addEventListener("load", countdown);
