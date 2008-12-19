class AddCourseIdToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :course_id, :integer
  end

  def self.down
    remove_column :courses, :course_id
  end
end
