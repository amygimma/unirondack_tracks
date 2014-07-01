class ApiController < ApplicationController
  before_action :authenticate_user!

  def campers
    @campers = Camper.all
    @campers_list = @campers.map do |u| 
      {:value => u.name, :id => u.id}
    end
    render json: @campers_list
  end
end
