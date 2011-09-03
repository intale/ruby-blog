class Admin < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :nick, :image

  has_many :posts
  has_one :image, :as => :entity, :dependent => :destroy
  validates :password, :confirmation => true, :if => :password_required?
  validates :username, :email, :nick,
            :presence => true,
            :length => {:minimum => 3, :maximum => 200},
            :uniqueness => { :case_sensitive => false }
  validates :email, :format => {:with => Devise.email_regexp}

  accepts_nested_attributes_for :image, :allow_destroy => true
  protected

  def password_required?
    new_record? || !password.nil? || !password_confirmation.nil?
  end

end
