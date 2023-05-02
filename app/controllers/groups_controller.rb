class GroupsController < ApplicationController
  before_action :current_group, only: %i[show edit update destroy]
  def index
    @groups = Group.all
  end

  def show 
    @group = Group.find(params[:id])
    @entities = @group.entities.order('created_at DESC')
  end

  def new 
    @new_group = Group.new
  end


 # create a new group in the html and json format
  def create
    @group = Group.new(group_parms)
    respond_to  do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

   def group_parms
    params.require(:group).permit(:name, :icon, :user_id)
  end

  def current_group
    @group = Group.find(params[:id])
  end

end