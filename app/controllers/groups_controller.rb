class GroupsController < ApplicationController
  before_action :current_group, only: %i[show edit update destroy]
  def index
    @groups = Group.all.where(user_id: current_user.id)
  end

  def show; end

  def new
    @new_group = Group.new
  end

  # create a new group in the html and json format
  def create
    @group = Group.new(group_parms)
    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def group_parms
    params.require(:group).permit(:name, :icon).merge(user_id: current_user.id)
  end

  def set_author
    @author = current_user
  end

  def current_group
    @group = Group.find(params[:id])
  end
end
