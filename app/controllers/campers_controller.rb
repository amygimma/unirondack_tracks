class CampersController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def index
    @campers = Camper.order(name: :asc)
    @camp_sessions = CampSession.order(name: :asc)
  end
end
