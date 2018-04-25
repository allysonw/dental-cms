module ApplicationHelper
  def display_price(price)
    number_to_currency(price)
  end
end
