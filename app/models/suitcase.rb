class Suitcase < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :destination, presence: true
  has_one_attached :photo
end
