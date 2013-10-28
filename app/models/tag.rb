class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  validates :name, :presence => true, :uniqueness => true

  before_save :normalize_tag

  private
  def normalize_tag
    self.name.strip!
    self.name.gsub!(/[^\w|^\s]/, "_")
  end
end