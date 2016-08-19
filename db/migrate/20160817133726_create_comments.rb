class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.string :text
      t.integer :rating, default: 0
      t.timestamps null: false
    end
  end
end
