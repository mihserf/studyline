class CreateEventTranslations < ActiveRecord::Migration
  def self.up
    create_table :event_translations do |t|
      t.integer :localedb_id
      t.integer :event_id
      t.string :name
      t.text :description
      t.text :short_description

      t.timestamps
    end
  end

  def self.down
    drop_table :event_translations
  end
end
