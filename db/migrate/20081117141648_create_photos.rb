class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :photoable_id
      t.string  :photoable_type

      t.integer  :size  # file size in bytes
      t.string :content_type    # mime type, ex: application/mp3
      t.string :filename   # sanitized filename
      t.integer :height  # in pixels
      t.integer :width  # in pixels
      t.integer :parent_id  # id of parent image (on the same table, a self-referencing foreign-key).
                            # Only populated if the current object is a thumbnail.
      t.string :thumbnail  # the 'type' of thumbnail this attachment record describes.
                            # Only populated if the current object is a thumbnail.
                            # Usage:
                            # [ In Model 'Avatar' ]
                            #   has_attachment :content_type => :image,
                            #                  :storage => :file_system,
                            #                  :max_size => 500.kilobytes,
                            #                  :resize_to => '320x200>',
                            #                  :thumbnails => { :small => '10x10>',
                            #                                   :thumb => '100x100>' }
                            # [ Elsewhere ]
                            # @user.avatar.thumbnails.first.thumbnail #=> 'small'
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
