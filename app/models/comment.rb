class Comment < ApplicationRecord

  validates :text, presence: true

  has_many :likes, as: :likeable, dependent: :destroy

  belongs_to :user

  belongs_to :post

end
