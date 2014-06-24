class CampersController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def index
    @campers = Camper.all
  end
end
