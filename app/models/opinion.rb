class Opinion < ActiveRecord::Base
  has_one :opinion_photo
  belongs_to :course
  
  include SetPermalink
  
end
