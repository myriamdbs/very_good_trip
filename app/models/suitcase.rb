class Suitcase < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :destination, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_one_attached :photo


  def member_users
    members.map do |member|
      member.user
    end
  end
end
