class Photo < ActiveRecord::Base
  
  belongs_to :photoable, :polymorphic => true

  has_attachment  :max_size => 2.megabytes, :content_type => :image, :resize_to => '400x', :thumbnails => { :thumb => '50x', :view => '201x' },
    :storage => :file_system, :path_prefix => 'public/photos', :processor => 'ImageScience'
  validates_as_attachment

end
