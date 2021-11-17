class LoutresController < ApplicationController
  def index
    @loutres = Loutre.all
  end

  def show
    @loutre = Loutre.find(params[:id])
    # @loutre.user = current_user
  end
end
