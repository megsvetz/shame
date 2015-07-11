class AddPicColumnToCategories < ActiveRecord::Migration
  def up
    add_attachment :categories, :cat_pic
  end

  def down
    remove_attachment :categories, :cat_pic
  end
end
