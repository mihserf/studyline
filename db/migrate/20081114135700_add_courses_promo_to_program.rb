class AddCoursesPromoToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :courses_promo, :text
  end

  def self.down
    remove_column :programs, :courses_promo
  end
end
