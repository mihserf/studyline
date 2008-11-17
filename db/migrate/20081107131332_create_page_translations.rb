class CreatePageTranslations < ActiveRecord::Migration
  def self.up
    create_table :page_translations do |t|
      t.integer :page_id
      t.integer :localedb_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :page_translations
  end
end
