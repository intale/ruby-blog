class Comment < ActiveRecord::Base
  apply_simple_captcha

  attr_accessor :current_admin
  belongs_to :post

  after_create :notify_admin

  validates :content, :post_id, :author, :presence => true
  validates :content, :length => {:minimum => 1, :maximum => 10000}
  validates :author, :length => {:minimum => 3, :maximum => 20}
  validate :check_author

  protected

  def notify_admin
    AdminMailer.comment_notifier(id).deliver
  end

  def check_author
    nick = Admin.select(:nick).where(:nick => self.author.strip.downcase)
    errors.add(:author, "Nick #{self.author} has already been taken by admin") if nick && !self.current_admin
  end

end