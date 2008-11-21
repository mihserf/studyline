class Admin::PagesController < ApplicationController
  before_filter :admin_required

 

  def index
    @pages=Page.find(:all, :order => :permalink)
    #render(:layout=>"admin")
  end

  def new
    @page=Page.new
  end

  def create
    @page=Page.new(params[:page])
    if  @page.save!
      flash[:notice]="Страница создана."
      redirect_to admin_l_pages_path(@lang.to_s.split('-').first)
    else
      render :action => "new"
    end
  end

  def edit
    @page=Page.find(params[:id])
    #render(:layout=>"admin")
  end

  def update
    @page=Page.find(params[:id])
    if  @page.update_attributes(params[:page])
      expire_fragment(:fragment => 'page1')# if params[:id].to_i==1
      flash[:notice]="страница обновлена"
      redirect_to admin_l_pages_path(@lang.to_s.split('-').first)
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_to do |format|
      format.html { redirect_to(admin_pages_url) }
      format.xml  { head :ok }
    end
  end
  
end
