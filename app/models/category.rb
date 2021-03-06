class Category < ActiveRecord::Base
  has_many :posts
  belongs_to :user

  has_attached_file :cat_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cat_pic, :content_type => /\Aimage\/.*\Z/
  
end
