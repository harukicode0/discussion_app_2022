class RoomTagUserForm
  include ActiveModel::Model

  attr_accessor(
    :title, :name,:owner_id, :deadline, :user_id, :room_id, :tag_name, :owner_id, :user_name,
    :created_at, :updated_at, :owner_id)

  with_options presence: true do
    validates :title ,presence: {message: "は必ず入力してください"}
    validates :deadline
  end

  def save
    room = Room.create(title: title, user_ids: [user_id], deadline:deadline, owner_id: owner_id)
    Owner.create(name: user_name, owner_id: user_id,room_id: room.id)
    Tag.create(tag_name: tag_name, room_ids: [room.id]) if tag_name != ""
    @room_id = room.id
  end
end