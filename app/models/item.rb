class Item < ApplicationRecord
  belongs_to :suitcase 
  default_scope { order(created_at: :desc)}
  scope :packed, -> { where(packed: true) } 
  scope :unpacked, -> { where(packed: false) }
end
