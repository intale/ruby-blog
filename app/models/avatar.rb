class Avatar < ActiveRecord::Base
  belongs_to :entity, :polymorphic => true

  has_attached_file :photo, :styles => {:medium => ["100x100",:jpg], :thumb => ["50x50",:jpg]},
                    :path => "#{Rails.root}/app/assets/images/avatar/:id/:style/:id-:style.:extension",
                    :url => "avatar/:id/:style/:id-:style.:extension",:default_url => "no-avatar.gif"

end
