class RoomTagUserForm
  include ActiveModel::Model

  attr_accessor(
    :name, :deadline, :user_id, :room_id, :tag_name, :owner_id, :user_name,
    :created_at, :updated_at, :owner_id)

  with_options presence: true do
    validates :name ,presence: {message: "は必ず入力してください"}
    # validates :tag_name
    validates :deadline
    validates :owner_id
  end

  def save
    room = Room.create(name: name, user_ids: [user_id], deadline:deadline)
    Owner.create(name: user_name, owner_id: user_id,room_id: room.id)
    if tag_name != "" or nil
      Tag.create(tag_name: tag_name, room_ids: [room.id])
    end
    @room_id = room.id
  end
end