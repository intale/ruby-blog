class Comment < ActiveRecord::Base
  belongs_to :post

  validates :content, :post_id, :author, :presence => true
  validates :content, :length => {:minimum => 1, :maximum => 10000}
  validates :author, :length => {:minimum => 2, :maximum => 20}

end