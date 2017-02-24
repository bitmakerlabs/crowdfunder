class PhotoController < ApplicationController

def index
  @photos = Photo.all
end

def show
  @photo = Photo.find(params[:id])
end

private
  def image_params
    params.require(:photo).permit(:image)
  end

end
