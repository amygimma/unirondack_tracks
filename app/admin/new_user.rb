 ActiveAdmin.register_page "New User" do

    sidebar :help do
      ul do
        li "To create a user, add the user name and password"
      end
    end

    content do
      para "User Form Here"
      form do |f|
	f.text_field "1", "2"
      end
      
#       form_tag(controller: "people", action: "search", method: "get", class: "nifty_form")
    end
  end