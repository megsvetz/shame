class CreatePostRatings < ActiveRecord::Migration
  def change
    create_table :post_ratings do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.boolean :like
      t.timestamps null: false
    end
  end
end
