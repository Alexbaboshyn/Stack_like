class AddRatingToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rating, :integer, default: 0
  end
end
