class Item < ApplicationRecord
  belongs_to :suitcase
  belongs_to :member
  has_one :user_in_charge, through: :member, class_name: "User", source: :user
  default_scope { order(created_at: :desc)}
  scope :packed, -> { where(packed: true) }
  scope :unpacked, -> { where(packed: false) }
end
