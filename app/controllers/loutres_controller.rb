class LoutresController < ApplicationController
  def show
    @loutre = Loutre.find(params[:id])
  end
end
