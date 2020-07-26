require_relative 'base_page'
class AccountSummaryPage < BasePage
  path '/bank/account-summary.html'
  validate  :title, /\AZero - Account Summary\z/
  section   :main_menu
  section   :top_nav_menu
end
