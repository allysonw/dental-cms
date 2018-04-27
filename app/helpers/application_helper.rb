module ApplicationHelper
  def display_price(price)
    number_to_currency(price)
  end

  def form_submit_button_text(object)
    object.persisted? ? "Update #{object.class}" : "Create #{object.class}"
  end
end
