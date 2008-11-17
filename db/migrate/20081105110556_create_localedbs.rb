class CreateLocaledbs < ActiveRecord::Migration
  def self.up
    create_table :localedbs do |t|
      t.string :short
      t.string :code
      t.boolean :master

      t.timestamps
    end

    Localedb.create!(:short=>"ru",:code=>"ru-RU",:master=>true)
    Localedb.create!(:short=>"en",:code=>"en-US",:master=>false)

  end

  def self.down
    drop_table :localedbs
  end
end
