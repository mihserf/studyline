class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :permalink
      t.string :name
      t.text :content
      t.string :controller_name

      t.timestamps
    end

    Page.create(:name=>"Главная", :permalink => "home")
    Page.create(:name=>"О нас", :permalink => "about_us")
    Page.create(:name=>"Услуги", :permalink => "services")
    Page.create(:name=>"Отзывы", :permalink => "opinions")
    Page.create(:name=>"Контакты", :permalink => "contacts")

  end

  def self.down
    drop_table :pages
  end
end
