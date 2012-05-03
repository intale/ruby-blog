class Admin < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :lockable, :unlock_strategy => :none

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :nick, :avatar

  has_many :posts

  validates :password, :presence => true, :length => {:minimum => 6, :maximum => 20},
                       :confirmation => true, :if => :password_required?
  validates :username, :email, :nick,
            :presence => true,
            :length => {:minimum => 3, :maximum => 200},
            :uniqueness => { :case_sensitive => false }
  validates :email, :format => {:with => Devise.email_regexp}



  SUPERADMINS = %w(intale.a@gmail.com max.dolgih@faceit.com.ua)

  def superadmin?
    Admin::SUPERADMINS.include?(email)
  end

  protected


  def password_required?
    new_record? || !password.nil? || !password_confirmation.nil?
  end

end
