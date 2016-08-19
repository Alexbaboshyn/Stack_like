class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.references :likeable, polymorphic: true, index: true
      t.integer :kind, default: 0

      t.timestamps null: false
    end
  end
end
