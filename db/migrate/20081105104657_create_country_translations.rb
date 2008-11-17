class CreateCountryTranslations < ActiveRecord::Migration
  def self.up
    create_table :country_translations do |t|
      t.integer :localedb_id
      t.integer :country_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :country_translations
  end
end
