class Comment < ActiveRecord::Base
  apply_simple_captcha
  attr_protected :post_id
  attr_accessor :current_admin
  belongs_to :post

  validates :content, :post_id, :author, :presence => true
  validates :content, :length => {:minimum => 1, :maximum => 10000}
  validates :author, :length => {:minimum => 3, :maximum => 20}
  validate :check_author

  protected

  def check_author
    nick = Admin.select(:nick).find_by_nick(self.author.strip.downcase)
    errors.add(:author, "Nick #{self.author} has already been taken by admin") if nick && !self.current_admin
    errors.add(:author, "You are not #{self.author}. Don't even try to fuck me!") if self.current_admin and self.current_admin.nick != self.author
  end

end