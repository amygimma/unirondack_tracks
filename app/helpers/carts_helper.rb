module CartsHelper
  # the extra methods here will help when I figure out how to choose a camp session first
  def list_of_campers(camp_session)
    Camper.where(camp_session: camp_session)
  end

  def list_of_campers
    Camper.all
  end

  def camper_name
    cart = Cart.find(params[:id])
    Camper.find(cart.camper_id)
  end

  def camp_sessions_list
    CampSession.all
  end
end
