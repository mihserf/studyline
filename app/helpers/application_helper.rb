# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def admin?
    session[:admin]
  end


  def lang_id(lang)
    lang.to_s.split("-").first
  end

  def ident_choice(obj)
     render :partial => "shared/ident_choice", :locals => {:obj => obj, :obj_name => obj.class.to_s.tableize.singularize}
  end

  #add  class name suffix if the page other then home.
  def other_class
    "_other"  unless params[:controller]=="pages" && params[:action]=="home"
  end

  def menu_top
    render :partial => "shared/menu_top"
  end

  def menu_left
    render :partial => "shared/menu_left"
  end

  def photo(program)
    photo = program.photo || (program.country.photo unless program.country.nil?)
    render :partial => "shared/photo", :locals => {:photo => photo} unless photo.nil?
  end

  def static_page(objs)
    page=Page.find(:first, :conditions => {:controller_name => objs.first.class.to_s.tableize})
    unless page.nil?
      render  :partial => "shared/static_page", :locals => {:page => page}
    end
  end


end
