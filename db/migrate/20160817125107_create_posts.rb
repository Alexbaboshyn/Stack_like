class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :author_id, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true
      t.string :title
      t.string :description
      t.integer :rating, default: 0
      t.timestamps null: false
    end
  end
end
