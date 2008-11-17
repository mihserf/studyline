class CreateCourseTranslations < ActiveRecord::Migration
  def self.up
    create_table :course_translations do |t|
      t.integer :localedb_id
      t.integer :course_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :course_translations
  end
end
