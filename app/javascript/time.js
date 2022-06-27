function countdown(){
const now=new Date();//今の時間
const deadline=Document.getElementsByClassName("deadline");//deadlineを取得
// const differ=deadline.getTime()-now.getTime();//明日まであと何ミリ秒か
console.log(deadline)
// const sec=Math.floor(differ/1000)%60;//ミリ秒を秒に直してから
// const min=Math.floor(differ/1000/60)%60;//1時間=60分だからね
// const hour=Math.floor(differ/1000/60/60);

// document.getElementById("hour").textContent=String(hour).padStart(2,"0"); //一桁になった時0がつくように
// document.getElementById("min").textContent=String(min).padStart(2,"0")
// document.getElementById("sec").textContent=String(sec).padStart(2,"0")
// setTimeout(countdown,1000);
}

window.addEventListener('load',countdown());