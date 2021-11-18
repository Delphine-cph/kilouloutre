class PagesController < ApplicationController
  def home
  end

  def dashboard
    @loutres = policy_scope(Loutre).where(user: current_user)
    @locations = Location.where(user: current_user)

  end
end
