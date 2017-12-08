class Api::SongsController < ApplicationController
  def index
    render json: Song.all
  end

  def create
    song = Song.new(song_params)
    if song.save
      render json: song
    else
      render json: { message: 'song failed to create'}, status: 422
    end
  end

  def update
    song = Song.find(params[:id])
    if song.update(song_params)
      render json: song
    else
      render json: { message: 'song failed to update' }, status: 422
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    render json: { message: 'song has been deleted' }
  end

  private 
    def song_params
      params.require(:song).permit(:name, :artist)
    end
end