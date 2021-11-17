class LoutresController < ApplicationController

  def index
    @loutres = policy_scope(Loutre).order(created_at: :desc)
  end

  def show
    @loutre = Loutre.find(params[:id])
    authorize @loutre
  end
end
