class RoomTagUserForm
  include ActiveModel::Model

  attr_accessor(
    :id, :title,:days, :owner_id, :deadline, :user_id, :room_id, :tag_name, :created_at, :updated_at, :tag_id)

    days_regex = /[1-5]/
  with_options presence: true do
    validates :title ,presence: {message: "タイトルは必ず入力してください"}
    validates :days, format: {with: days_regex, message: "開催期間は１〜5日のいずれかを選択してください。"}
  end

  def save
    room = Room.create(title: title, user_ids: [user_id], deadline: Time.now + days.to_i.days, owner_id: user_id)
    if tag_name != ""
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      RoomTag.create(room_id: room.id, tag_id: tag.id)
    end
    @room_id = room.id
  end

  def update(params,room)
    #一度タグの紐付けを消す
    room.room_tags.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

     #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    #タグを保存
    tag.save if tag_name.present?
    RoomTag.create(room_id: room.id, tag_id: tag.id) if tag_name.present?

    room.update(title: title)
    @room_id = room.id
  end
end