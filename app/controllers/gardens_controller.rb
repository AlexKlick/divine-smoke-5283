class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    binding.pry
    @plants = @garden.g_plants
  end
end
