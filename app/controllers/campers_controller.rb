class CampersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def index
    if params[:session]
      @campers = Camper.where("camp_session_id = ?", params[:session]).order(name: :asc)
    else
      @campers = Camper.order(name: :asc)
    end
    @camp_sessions = CampSession.order(name: :asc)
    @cart = Cart.new
  end

  private

  def user_params
    params.require(:camper).permit(:account_balance)
  end
end
