class CreateOpinionTranslations < ActiveRecord::Migration
  def self.up
    create_table :opinion_translations do |t|
      t.string :name
      t.text :about
      t.text :short_text
      t.text :description
      t.integer :localedb_id
      t.integer :opinion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :opinion_translations
  end
end
