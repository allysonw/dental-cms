module ApplicationHelper
  def display_price(price)
    number_to_currency(price)
  end

  def form_submit_button_text(object)
    object.persisted? ? "Update #{object.model_name.human.titleize}" : "Create #{object.model_name.human.titleize}"
  end
end
