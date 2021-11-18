class LoutresController < ApplicationController

  def index
    @loutres = policy_scope(Loutre).order(created_at: :desc)
  end

  def show
    @loutre = Loutre.find(params[:id])
    authorize @loutre
  end

  def new
    @loutre = Loutre.new
    @user = current_user
    authorize @loutre
  end

  def create
    @loutre = current_user.loutres.new(loutre_params)
    authorize @loutre
    if @loutre.save!
      flash[:notice] = 'Votre annonce a bien été enrengistrée.'
    else
      render :new
    end
  end
end

  private

  def loutre_params
    params.require(:loutre).permit(:name, :personality, :event, :price, :image)
  end
