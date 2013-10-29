class Post < ActiveRecord::Base

  belongs_to :admin
  has_many :comments, :dependent => :destroy
  has_and_belongs_to_many :tags

  validates :admin_id, :subject, :message, :presence => true
  validates :truncate_character, :numericality => {:only_integer => true, :grater_than => 0}

  before_save :update_post_message

  def update_post_message
    self.message = Nokogiri::HTML.parse(self.message).search("body").inner_html
  end

  scope :enabled, -> { where(" \"posts\".status = 'false' ")}

  def to_param
    "#{id}-#{RusAlpha.translate(subject.to_s).parameterize}"
  end

end