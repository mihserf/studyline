class EventPhoto < ActiveRecord::Base
  belongs_to :event

  has_attachment  :max_size => 2.megabytes, :content_type => :image, :resize_to => '400x', :thumbnails => { :thumb => '60x', :view => '120x' },
    :storage => :file_system, :path_prefix => 'public/photos/events', :processor => 'ImageScience'
  validates_as_attachment
end
