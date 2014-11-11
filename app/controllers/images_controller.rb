class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  def show
    @image = Image.find(params[:id])
  end
  def create
    @image = Image.create(image_params)
  end
  def destroy
    @image = Image.find(params[:id])

    @image.destroy
  end
  private

    def image_params
      params.require(:image).permit(:text)
    end
end
