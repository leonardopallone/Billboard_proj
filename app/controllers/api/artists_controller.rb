class Api::ArtistsController < ApplicationController
  before_action :set_billboard # PARENT 
  before_action :set_artist, only: [:show, :update, :destroy]

  def index # creates all the items 
    render json: @billboard.atrists
  end

  def show #needs an ID
    # @artist = Artist.find(params[:id])
    render json: @artist
  end 

  def create # only works if it pass the PARAMS and MODEL VALIDATIONS
    @artist = Artist.new(artist_params)
    if @artist.save
      render json: @artist
    else
      render json: { errors: @artist.errors },  status: :unprocessable_entity
    end
  end

  def update # need an ID and the fields that are changing. Will only update the item if it passes the params and Validations 
    # @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: { errors: @artist.errors },  status: :unprocessable_entity
    end
  end

  # def destroy
  #   @model_name = Model_name.find(params[:id])
  #   @model_name.destroy
  #   render json: { message: 'Model_name deleted' }
  # end

  def destroy #need the ID aand will delete the item 

    # @artist = Artist.find(params[:id])
    @artist.destroy
    render json: { message: 'Artist deleted'}
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

    def artist_params #for the create item
      params.require(:artist).permit(:name, :rank)
    end

    
    def set_artist
      @artist = @billborad.artists.find(params[:id])
    end

    def set_billboard
      @billboard = Billboard.find(params[:billboard_id])
      end
    
  
end


end
