function post() {
  const submit = document.getElementById("comment_bottom_r");
  if (!submit) return null;
  submit.addEventListener("click", function (e) {
    // クリック動作をキャンセルすることでデータが二重に送信されるのを防ぐ
    e.preventDefault();
    // 入力フォームの位置情報を取得
    const form = document.getElementById("comment-form");
    // 入力フォームの内容を取得
    const formData = new FormData(form);
    // 非同期通信を行うためのオブジェクトを生成、リクエストの内容を入れる
    const XHR = new XMLHttpRequest();
    // リクエストの内容を書き換える
    XHR.open("POST", "/rooms/29/comments", true);
    // 受け取るレスポンスの種類をあらかじめ設定する
    XHR.responseType = "json";
    XHR.send(formData);
  });
}

window.addEventListener("load", post);
