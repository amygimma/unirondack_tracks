 ActiveAdmin.register_page "Weekly Inventory" do
    one_week_ago = Time.now - 60*60*24*7
    sidebar :help do
      ul do
        li "First Line of Help"
      end
    end

    content do
      para "Sales last 7 days"
      totals_hash = {}

      @carts = Cart.where("created_at >= ?", one_week_ago )
      @carts.each do |cart|
	cart.update_cart_total
	cart.items.each do |item|
	  if totals_hash.has_key? item.name.to_s
	    totals_hash[item.name.to_s] = totals_hash[item.name.to_s] + item.price
	  else
	    totals_hash[item.name.to_s] = item.price
	  end
	end
      end
      totals_hash.each do |item, price|
	para "#{item}: #{number_to_currency(price)}"
      end
    end
  end