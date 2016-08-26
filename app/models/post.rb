class Post < ApplicationRecord

  validates :title, presence: true

  validates :description, presence: true

  validates :rating, numericality: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  belongs_to :category

  has_many :likes, as: :likeable, dependent: :destroy

  has_many :comments, dependent: :destroy



  scope :visible, -> { where(is_deleted: false) }

end
