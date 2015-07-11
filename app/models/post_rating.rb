class PostRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  scope :good, -> { where(like: true) }
  scope :bad, -> { where(like: false) }


  def self.good_count
    self.good.count
  end

  def self.bad_count
    self.bad.count
  end

  def self.total_count
    self.good_count - self.bad_count
  end
end
