class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :post_ratings

  has_attached_file :post_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :post_pic, :content_type => /\Aimage\/.*\Z/
  
end
