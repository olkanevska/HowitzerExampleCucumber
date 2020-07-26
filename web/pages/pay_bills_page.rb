require_relative 'base_page'
class PayBillsPage < BasePage
  path '/bank/pay-bills.html'
  validate  :title, /\AZero - Pay Bills\z/
  section   :main_menu
  section   :top_nav_menu

  element   :tab,                 '.ui-state-default'
  element   :currency_dropdown,   '#pc_currency'
  element   :currency_list,       '#pc_currency option'
  element   :amount,              '#pc_amount'
  element   :radio_button,        '.radio'
  element   :calculate_costs,     '#pc_calculate_costs'
  element   :purchase_button,     '#purchase_cash'

  def click_tab(title)
    Howitzer::Log.info "Click on '#{title}' tab"
    tab_element(text: /^#{title}$/).click
  end

  def click_purchase_button
    Howitzer::Log.info "Click Purchase button"
    purchase_button_element.click
  end

  def select_currency(currency)
    Howitzer::Log.info "Select the'#{currency}' currency"
    currency_dropdown_element.click
    currency_list_element(text: currency).click
  end

  def fill_in_amount(amount_value)
    Howitzer::Log.info "Fill in the following '#{amount_value}'amount"
    amount_element.set(amount_value)
  end

  def chose_currency_amount(currency_amount)
    Howitzer::Log.info "Chose '#{currency_amount}'"
    radio_button_element(text: currency_amount).click
  end

  def fill_in_currency_cash_form(attributes)
    Howitzer::Log.info "Fill in Purchase foreign currency cash form wit the attributes #{attributes}"
    select_currency(attributes['currency'])
    fill_in_amount(attributes['amount'])
    chose_currency_amount(attributes['currency_amount'])
    calculate_costs_element.click
  end

end