class PagesController < ApplicationController
  
   def show
    page = params[:id]
	if File.exists?("#{RAILS_ROOT}/app/views/pages/#{page}.html.erb")
		
                render :action => page

                #redirect_to :action => page
        end
        
    @page = Page.find_by_permalink(params[:id])

  end

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
      flash[:notice]="Страница создана. Добавте изменения в файл /config/routes.rb"
      redirect_to pages_path
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
      redirect_to lang_pages_path(@lang.to_s.split('-').first)
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end


  def home
    @page=Page.find_by_permalink("home")
  end

end
