class LoutresController < ApplicationController
  def index
    @loutres = Loutre.all

  def show
    @loutre = Loutre.find(params[:id])
  end
end
