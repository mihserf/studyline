class Admin::ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def new
    @program=Program.new
  end

  def create
    @program=Program.new(params[:program])

    @program.build_photo(params[:photo])  unless params[:photo].nil?

    if  @program.save!
      unless params[:program][:parent_id].empty?
        @program.move_to_child_of Program.find(params[:program][:parent_id])
      end
      flash[:notice]="Программа создана."
      redirect_to admin_l_programs_path(@lang.to_s.split('-').first)
    else
      render :action => "new"
    end
  end

  def edit
    @program=Program.find(params[:id])
  end

  def update
    @program=Program.find(params[:id])
    unless @program.parent_id==params[:program][:parent_id] || params[:program][:parent_id].empty?
      @program.move_to_child_of Program.find(params[:program][:parent_id])
    end
    if params[:program][:parent_id].empty? && @program.parent_id!=nil
      @program.move_to_root
    end

    # changing program position in the siblings list
    unless params[:sortable_ids].empty?
      sortable_ids = params[:sortable_ids].split(',')
      unless @program.id==sortable_ids.last.to_i
        
        new_neightbour = sortable_ids[sortable_ids.index(sortable_ids.find{|i| i.to_i==@program.id})+1].to_i
        @program.move_to_left_of Program.find(new_neightbour)
      else
        new_neightbour = sortable_ids[sortable_ids.index(sortable_ids.find{|i| i.to_i==@program.id})-1].to_i
        @program.move_to_right_of Program.find(new_neightbour)
      end
    end

    unless params[:photo].nil?
      if @photo = @program.photo
        @photo.update_attributes(params[:photo])
      else
        @program.create_photo(params[:photo])
      end
    end

    if  @program.update_attributes(params[:program])
      flash[:notice]="программа обновлена"
      redirect_to admin_l_programs_path(@lang.to_s.split('-').first)
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    respond_to do |format|
      format.html { redirect_to(admin_programs_url) }
      format.xml  { head :ok }
    end
  end

end
