class ImageSetsController < ApplicationController
  def index
    @image_sets = ImageSet.includes(:images).all
  end
  def show
    @image_set = ImageSet.find(params[:id])
  end
  def create
    @image_set = ImageSet.create(image_set_params)
  end
  def destroy
    @image_set = ImageSet.find(params[:id])

    @image_set.destroy
  end
  private

    def image_set_params
      params.require(:image_set).permit(:question)
    end
end
