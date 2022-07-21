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
    // データがちゃんと通信できて帰ってきた場合
    XHR.onload = () => {
      console.log(XHR.response);
      const item = XHR.response.comment;
      console.log(item);
      const html = `
      <div class="comment">
    <div class="comment-user-image-wrap">
        <%if comment.user.image.attached?%>
          <%=link_to image_tag(comment.user.image.variant(resize: '50x50',gravity: "center", crop:"40x40+0+0").processed),user_path(comment.user.id), class:"comment-user-image"%>
        <%else%>
          <%= link_to image_tag('hito.png'),user_path(comment.user.id), class:"comment-user-image"%>
        <%end%>
    </div>

    <div class="comment-right">
      <div class="comment-header">
          <div class="comment-user-name">
          <%=link_to comment.user.nickname, user_path(comment.user.id)%>
          </div>
          <div class="comment-time">
          <%= comment.updated_at%>
          </div>
      </div>

      <div class="comment-body">
        <%= comment.text%>
      </div>

      <div class="comment-footer">
        <div class="comment-footer-like">
          <% if user_signed_in?%>
            <% if comment.like?(current_user,comment) %>
                <%= link_to room_comment_like_path(@room.id, comment.id), method: :delete do %>
                  <%= image_tag'heart-red.png'%><span class="comment-heart comment-heart-red"><%=comment.count_like(comment)%></span>
                <% end %>
            <% else %>
                <%= link_to room_comment_likes_path(@room.id, comment.id), method: :post do %>
                  <%= image_tag'heart.png'%><span class="comment-heart comment-heart-gray"><%=comment.count_like(comment)%></span>
                <% end %>
            <% end %>
          <%else%>
            <%= image_tag'heart.png'%><span class="comment-heart  comment-heart-gray"><%=comment.count_like(comment)%></span>
          <%end%>
        </div>
          <div class="comment-footer-author">
            <%= link_to "編集", edit_room_comment_path(@room,comment),class:'comment-edit-btn'%>
            <%= link_to "削除", room_comment_path(@room,comment),method: :delete,class:'comment-destroy-btn'%>
          </div>
      </div>
    </div>
  </div>`;
      if (item.standing_position_id == 2) {
        const list = document.getElementById("disagree-text-area");
        list.insertAdjacentHTML("beforeend", html);
      } else if (item.standing_position_id == 1) {
        const list = document.getElementById("agree-text-area");
        list.insertAdjacentHTML("beforeend", html);
      }
    };
  });
}

window.addEventListener("load", post);
