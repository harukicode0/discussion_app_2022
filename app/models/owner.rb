class Owner < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :room
end
