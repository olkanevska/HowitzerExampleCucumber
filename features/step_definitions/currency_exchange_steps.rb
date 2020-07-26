#############################################################
#                      PREREQUISITES                        #
#############################################################


####################################
#              ACTIONS             #
####################################

When /I click (.+?) tab/ do |title|
  PayBillsPage.on { click_tab(title) }
end

When 'Fill in Purchase foreign currency cash form with the next data:' do |table|
  PayBillsPage.on do
    table.hashes.each do |attributes|
      fill_in_currency_cash_form(attributes)
    end
  end
end

When 'I click Purchase button' do
  PayBillsPage.on {click_purchase_button}
  sleep 10
end

####################################
#              CHECKS              #
####################################

