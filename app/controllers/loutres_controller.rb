class LoutresController < ApplicationController
  def index
    @loutres = Loutre.all
  end
end
