module ProgramsHelper
  def program_set(class_or_item, mover = nil)
          class_or_item = class_or_item.roots if class_or_item.is_a?(Class)
          items = Array(class_or_item)
          result = []
          items.each do |root|
            result += root.self_and_descendants.map do |i|
              if mover.nil? || mover.new_record? || mover.move_possible?(i)
               yield(i)
              end
            end.compact
          end
          result
   end

  def sub_programs_menu(class_or_item, mover = nil)
          class_or_item = class_or_item.roots if class_or_item.is_a?(Class)
          items = Array(class_or_item)
          result = []
          result<<"<ul  class='sf-menu sf-vertical'>"
          items.each do |root|
            result += root.children.map do |i|
              if mover.nil? || mover.new_record? || mover.move_possible?(i)
               yield(i)
              end
            end.compact
          end
          result<<"</ul>"
          result
   end

end
