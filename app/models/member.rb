class Member < ApplicationRecord

  attr_accessor :email

  belongs_to :user, optional: true
  belongs_to :suitcase
  has_many :items

  validates :user_id, uniqueness: { scope: :suitcase_id, message: "Ce compagnon a déjà été ajouté" }
end

