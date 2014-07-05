 ActiveAdmin.register_page "Donations" do
    donations = Cart.where.not(donation: 0)
    content do
      render 'donations'
    end
  end