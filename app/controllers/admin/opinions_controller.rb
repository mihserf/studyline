class Admin::OpinionsController < ApplicationController
   before_filter :admin_required


  def index
    @opinions=Opinion.find(:all, :order => :permalink)
  end

  def new
    @opinion=Opinion.new
  end

  def create
    @opinion=Opinion.new(params[:opinion])

    @opinion.build_opinion_photo(params[:opinion_photo])  unless params[:opinion_photo].nil?

    if  @opinion.save!
      flash[:notice]="Отзыв создан."
      redirect_to admin_l_opinions_path(@lang.to_s.split('-').first)
    else
      render :action => "new"
    end
  end

  def edit
    @opinion=Opinion.find(params[:id])
  end

  def update
    @opinion=Opinion.find(params[:id])

    unless params[:opinion_photo].nil?
      if @photo = @opinion.opinion_photo
        @photo.update_attributes(params[:opinion_photo])
      else
        @opinion.create_opinion_photo(params[:opinion_photo])
      end
    end

    if  @opinion.update_attributes(params[:opinion])
      expire_fragment(:fragment => 'opinion1')# if params[:id].to_i==1
      flash[:notice]="Отзыв обновлен"
      redirect_to admin_l_opinions_path(@lang.to_s.split('-').first)
    end
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to(admin_opinions_url) }
      format.xml  { head :ok }
    end
  end
end
