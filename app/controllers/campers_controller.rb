class CampersController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def index
    @campers = Camper.where("camp_session_id = ?", 1).order(name: :asc)
    @camp_sessions = CampSession.order(name: :asc)
  end
end
