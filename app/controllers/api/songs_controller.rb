class Api::SongsController < ApplicationController



  before_action :set_artist
  before_action :set_song, only: [:show, :update, :destroy]
  def index 
    render json: @artist.songs
  end

  def show 
    # @song = Song.find(params[:id])
    render json: @song
  end 

  def create
    @song = @artist.songs(song_params)
    if @song.save
      render json: @song
    else
      render json: { errors: @song.errors },  status: :unprocessable_entity
    end
  end

  def update
    # @song = Song.find(params[:id])
    if @song.update(song_params)
      render json: @song
    else
      render json: { errors: @song.errors },  status: :unprocessable_entity
    end
  end

  # def destroy
  #   @model_name = Model_name.find(params[:id])
  #   @model_name.destroy
  #   render json: { message: 'Model_name deleted' }
  # end
  def destroy
    # @song = Song.find(params[:id])
    @song.destroy
    render json: { message: 'Song delete'}
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

    

    def set_song
      @song = @artist.songs(params[:id])
    end

    def song_params
      params.require(:song).permit(:name, :duration)
    end

  def set_artist # to set parent and child relation see line 3
    @artist = Artist.find(params[:Artist_id])
  end

end



end
