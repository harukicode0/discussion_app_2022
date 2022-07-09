function countdown() {
  const now = new Date(); //今の時間
  const deadlines = document.getElementsByClassName("deadline"); //deadlineを取得
  if (!deadlines) return null;
  for (let i = 0; i < deadlines.length; i++) {
    const differ = new Date(deadlines[i].textContent) - now; //５日後まであと何ミリ秒か
    const differ_id = deadlines[i].getAttribute("id");
    if (differ > 0) {
      const min = Math.floor(differ / 1000 / 60) % 60;
      const hour = Math.floor(differ / 1000 / 60 / 60) % 24;
      const day = Math.floor(differ / 1000 / 60 / 60 / 24);
      if (day != 0) {
        document.getElementById("day" + differ_id).textContent = String(
          day + "日"
        );
      }
      document.getElementById("hour" + differ_id).textContent = String(
        hour + "時間"
      ).padStart(2, "0");
      //一桁になった時0がつくように
      document.getElementById("min" + differ_id).textContent = String(
        min + "分"
      ).padStart(2, "0");
    } else {
      document.getElementById("day" + differ_id).textContent = String("終了");
    }
  }
  setTimeout(countdown, 60000);
}

window.addEventListener("load", countdown);
