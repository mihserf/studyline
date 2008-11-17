class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :permalink
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
