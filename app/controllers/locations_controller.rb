class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @loutre = Loutre.find(params[:loutre_id])
    @location = Location.new(location_params)
    @location.loutre = @loutre
    @location.price = loutre_price
    @location.status = 'En attente'
    @location.save
  end

  # def update
  #   @location = Location.find(params[:id])
  #   @loutre = @location.loutre
  #   if @location.update(location_params)
  #     redirect_to @location
  #     flash[:notice] = 'les informations ont bien été misent à jour'
  #   else
  #     render :show
  #   end
  # end

  private

  def location_params
    params.require(:location).permit(:date_départ, :date_arrive, :status, :loutre_id, :user_id)
  end

  def loutre_price
    day_num = (@location.date_depart - @location.date_arrive)
    @loutre.loutre_price * day_num.to_f
  end
end
