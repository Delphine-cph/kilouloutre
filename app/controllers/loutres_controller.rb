class LoutresController < ApplicationController
  def index
    @loutres = Loutre.all
  end

  def show
    @loutre = Loutre.find(params[:id])
  end
end
