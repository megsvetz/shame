class AddPicColumnToPosts < ActiveRecord::Migration
  def up
    add_attachment :posts, :post_pic
  end

  def down
    remove_attachment :posts, :post_pic
  end
end
