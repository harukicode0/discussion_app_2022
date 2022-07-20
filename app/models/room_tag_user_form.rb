class RoomTagUserForm
  include ActiveModel::Model

  attr_accessor(
    :id, :title, :owner_id, :deadline, :user_id, :room_id, :tag_name, :created_at, :updated_at)

  with_options presence: true do
    validates :title ,presence: {message: "は必ず入力してください"}
    validates :deadline
  end

  def save
    room = Room.create(title: title, user_ids: [user_id], deadline:deadline, owner_id: user_id)
    Tag.create(tag_name: tag_name, room_ids: [room.id]) if tag_name != ""
    @room_id = room.id
  end

  def update
    room.update(title: title)
    Tag.update(tag_name: tag_name) if tag_name != ""
    @room_id = room.id
  end
end