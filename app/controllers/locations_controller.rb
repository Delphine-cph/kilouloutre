class LocationsController < ApplicationController

  def new
    @location = Location.new
    @loutre = Loutre.find(params[:loutre_id])
    @location.loutre = @loutre
    authorize @location
    authorize @loutre
  end

  def create
    @location = Location.new(locations_params)
    @loutre = Loutre.find(params[:loutre_id])
    @location.loutre = @loutre
    @location.user = current_user
    @location.save
    authorize @location
    authorize @loutre
    redirect_to loutre_path(@loutre)
  end

  def update
    @location = Location.find(locations_params[:id])
    @loutre = @location.loutre

    if @location.update(locations_params)
      redirect_to loutre_path(@loutre)
      flash[:notice] = 'Votre louloutre a bien été réservé'
    else
      render :show
    end
  end

  private

  def loutre_params
    params.require(:locations).permit(:date_arrive, :date_départ, :status, :user_id, :loutre_id)
  end

  def locations_params
    params.require(:location).permit(:date_arrive, :date_départ, :address, :status, :user_id, :loutre_id)
  end
end
