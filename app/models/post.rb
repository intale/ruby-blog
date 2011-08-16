class Post < ActiveRecord::Base
  belongs_to :admin
  has_many :comments, :dependent => :destroy
  has_and_belongs_to_many :tags

  before_save :update_post_message

  def update_post_message
    self.message = Nokogiri::HTML.parse(self.message).search("body").inner_html
  end

end