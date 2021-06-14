class PlantPlotsController < ApplicationController
  def destroy
    pplot = PlantPlot.find(pplot_params[:id]).destroy
    redirect_to '/plots'
  end

  private

  def pplot_params
    params.permit(:id)
  end
end
