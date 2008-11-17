class Admin::CountriesController < ApplicationController
  before_filter :admin_required, :only => [:index,:new,:create,:edit,:update]

  def index
    @countries=Country.find(:all, :order => :permalink)
  end

  def new
    @country=Country.new
  end

  def create
    @country=Country.new(params[:country])
    if  @country.save!
      flash[:notice]="Страна создана."
      redirect_to admin_l_countries_path(@lang.to_s.split('-').first)
    else
      render :action => "new"
    end
  end

  def edit
    @country=Country.find(params[:id])
  end

  def update
    @country=Country.find(params[:id])
    if  @country.update_attributes(params[:country])
      expire_fragment(:fragment => 'country1')# if params[:id].to_i==1
      flash[:notice]="Страна обновлена"
      redirect_to admin_l_countries_path(@lang.to_s.split('-').first)
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    respond_to do |format|
      format.html { redirect_to(admin_countries_url) }
      format.xml  { head :ok }
    end
  end
  
end
