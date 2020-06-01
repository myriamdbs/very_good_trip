class Member < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :suitcase
  has_many :items
end
