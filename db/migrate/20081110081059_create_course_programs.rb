class CreateCoursePrograms < ActiveRecord::Migration
  def self.up
    create_table :course_programs do |t|
      t.integer :program_id
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :course_programs
  end
end
