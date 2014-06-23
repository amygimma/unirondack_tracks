module ApplicationHelper
  def sizes(item)
    Item.where(name: item.name)
  end
end
