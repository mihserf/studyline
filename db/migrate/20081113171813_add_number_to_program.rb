class AddNumberToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :number, :integer
  end

  def self.down
    remove_column :programs, :number
  end
end
