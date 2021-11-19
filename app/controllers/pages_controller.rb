class PagesController < ApplicationController
  def home
  end

  def dashboard
    @loutres = policy_scope(Loutre).where(user: current_user)
    @locations = []
    @loutres.each do |loutre|
      loutre.locations.each do |location|
        @locations << location
      end
    end
    @loutre = Loutre.new
  end
end
