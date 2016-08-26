class User < ApplicationRecord
  has_secure_password

  # validates :is_admin, presence: true, default: false

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true

  validates_uniqueness_of :token, :allow_blank => true, :allow_nil => true



  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy


  scope :admin, -> { where(is_admin: true) }
  scope :not_admin, -> { where(is_admin: false) }

end
