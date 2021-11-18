class LoutresController < ApplicationController
  def index
    @loutres = policy_scope(Loutre).order(created_at: :desc)
    @markers = @loutres.geocoded.map do |loutre|
      {
        lat: loutre.latitude,
        lng: loutre.longitude,
        info_window: render_to_string(partial: "info_window", locals: { loutre: loutre })
      }
    end
  end

  def show
    @loutre = Loutre.find(params[:id])
    # @loutre.user = current_user
    authorize @loutre
  end
end
