class Comment < ApplicationRecord

  validates :text, presence: true

  has_many :likes, as: :likeable, dependent: :destroy

  belongs_to :user

  belongs_to :post

  COMMENT_CONSTANT = 3

  scope :visible, -> { where(is_deleted: false).joins(:user)
                                               .where(users:{ is_banned: false }) }

end
