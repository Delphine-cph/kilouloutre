class LocationsController < ApplicationController

  def new
    @location = Location.new
    @loutre = Loutre.find(params[:loutre_id])
    authorize @location
  end

  def create
    @location = Location.new(locations_params)
    @loutre = Loutre.find(params[:loutre_id])
    @location.loutre = @loutre
    @location.save
    redirect_to loutre_path(@loutre)
    authorize @location
  end

  private

  def loutre_params
    params.require(:locations).permit(:date_arrive, :date_départ, :status, :user_id, :loutre_id)
  end

  def locations_params
    params.require(:location).permit(:date_arrive, :date_départ, :status, :user_id, :loutre_id)
  end
end
