class AddCountryIdToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :country_id, :integer
  end

  def self.down
    remove_column :programs, :country_id
  end
end
