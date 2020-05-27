class Suitcase < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :destination, presence: true
end
