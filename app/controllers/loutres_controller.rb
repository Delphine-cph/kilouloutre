class LoutresController < ApplicationController

  def index
    @loutres = policy_scope(Loutre).order(created_at: :desc)
  end

  def show
    @loutre = Loutre.find(params[:id])
<<<<<<< HEAD
    # @loutre.user = current_user
=======
    authorize @loutre
>>>>>>> 7555826ba5ead1607faa9b8cea03c3401539ea82
  end
end
