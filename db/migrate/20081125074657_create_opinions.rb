class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.string :name
      t.text :about
      t.text :short_description
      t.text :description
      t.string :permalink
      t.integer :course_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :opinions
  end
end
