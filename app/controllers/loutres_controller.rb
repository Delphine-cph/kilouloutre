class LoutresController < ApplicationController

  def index
    @loutres = policy_scope(Loutre).order(created_at: :desc)
  end

  def show
    @loutre = Loutre.find(params[:id])
    @location = Location.new
    @location.loutre = @loutre
    authorize @location
    authorize @loutre
    # @loutre.user = current_user
  end
end
