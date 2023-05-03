class EntitiesController < ApplicationController
  before_action :set_group, only: %i[index create new]

  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities.order('created_at DESC')
  end

  def new
    @new_entity = Entity.new
    @group = Group.find(params[:group_id])
  end

  def create
    @entity = Entity.new(author_id: current_user.id, **entity_params)

    if @entity.save
      Expense.create!(group_id: @group.id, entity_id: @entity.id)
      flash[:notice] = 'Transaction recorded successfully'
      redirect_to group_entities_path(@group)
    else
      flash.now[:alert] = 'Transaction could not be saved'
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_group
    @group = Group.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
