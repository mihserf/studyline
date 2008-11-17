class CreateProgramTranslations < ActiveRecord::Migration
  def self.up
    create_table :program_translations do |t|
      t.integer :localedb_id
      t.integer :program_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :program_translations
  end
end
