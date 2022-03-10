class Api::BillboardsController < ApplicationController

  before_action :set_billboard, only: [:show, :update, :destroy]

  def index # creates all the items 
    render json: Billboard.all
  end

  def show #needs an ID
    # @billboard = Billboard.find(params[:id])
    render json: @billboard
  end 

  def create # only works if it pass the PARAMS and MODEL VALIDATIONS
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      render json: @billboard
    else
      render json: { errors: @billboard.errors },  status: :unprocessable_entity
    end
  end

  def update # need an ID and the fields that are changing. Will only update the item if it passes the params and Validations 
    # @billboard = Billboard.find(params[:id])
    if @billboard.update(billboard_params)
      render json: @billboard
    else
      render json: { errors: @billboard.errors },  status: :unprocessable_entity
    end
  end

  # def destroy
  #   @model_name = Model_name.find(params[:id])
  #   @model_name.destroy
  #   render json: { message: 'Model_name deleted' }
  # end

  def destroy #need the ID aand will delete the item 

    # @sub = Sub.find(params[:id])
    @billboard.destroy
    render json: { message: 'Billboard deleted'}
  end

  private 
    # make sure we are passing the right fields 
    # controller validations
    # permitting
    # { sub: { title: 'travel' } }

    # not permitted 
    # { person: { body: 'travel' } }

    # sql injection 
    # { sub: { title: 'SELECT * CCNUM FROM DB' } }

    def billboard_params #for the create item
      params.require(:billboard).permit(:title, :description)
    end
# for BEFORE ACTION LINE 
    def set_billboard
      @billboard = Billboard.find(params[:id])
    end
  
end
end
