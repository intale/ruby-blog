class Admin < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  has_many :posts
  validates :password, :confirmation => true, :if => :password_required?
  validates :nick, :presence => true
  validates :username, :email,
            :presence => true,
            :length => {:minimum => 3, :maximum => 20},
            :uniqueness => { :case_sensitive => false }
  validates :email, :format => {:with => Devise.email_regexp}

  protected

  def password_required?
    new_record? || !password.nil? || !password_confirmation.nil?
  end

end
