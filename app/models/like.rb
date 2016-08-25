class Like < ApplicationRecord

  enum kind: [:positive, :negative]

  belongs_to :likeable, polymorphic: true

  belongs_to :user

  validates_uniqueness_of :user_id, scope: [:likeable_type, :likeable_id]

end
