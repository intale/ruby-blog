class Comment < ActiveRecord::Base
  attr_protected :post_id
  attr_accessor :current_admin
  belongs_to :post

  validates :content, :post_id, :author, :presence => true
  validates :content, :length => {:minimum => 1, :maximum => 10000}
  validates :author, :length => {:minimum => 3, :maximum => 20}
  validate :check_author

  protected

  def check_author
    errors.add(:author, "Nick #{self.author} has already been taken by admin") if Admin.select(:nick).find_by_nick(self.author.strip.downcase) and !self.current_admin
  end

end