class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]
  
  def index
    @entities = Entity.find(params[:id])
  end

  def new
    @groups = Group.find(params[:id])
    @new_entity = Entity.new
    
    @expense = @entity.expenses.build
  end
  def create
    @entity = Entity.new(entity_params)
    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_path(@entity.expenses[0].group_id), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      end
    end
  end

  private

   # Use callbacks to share common setup or constraints between actions.
   def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :icon, :amount, expenses_attributes: [:group_id])
  end
end
