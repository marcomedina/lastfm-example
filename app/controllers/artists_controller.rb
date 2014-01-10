class ArtistsController < ApplicationController
  def index
    @songs = Song.order('listeners DESC')
    @artists = Artist.order('listeners DESC')
  end

  def show
    raise ControllerActionNotImplementedYetException
  end
end
