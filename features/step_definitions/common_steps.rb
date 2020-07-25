#############################################################
#                      PREREQUISITES                        #
#############################################################

Given /(.+) page of web application/ do |page|
  page.open
end

####################################
#              ACTIONS             #
####################################

When /I am navigating on (.+) page/ do |page|
  page.open
end
#
# When /I click (.+?) menu item on (.+) page/ do |text, page|
#   page.on { main_menu_section.choose_menu(text.capitalize) }
# end
#
# When /I click (.+?) link on (.+) page/ do |text, page|
#   page.on { navigate_to_link(text.capitalize) }
# end

When /I click (.+?) button on (.+) page/ do |title, page|
  page.on { click_button(title) }
end

####################################
#              CHECKS              #
####################################

Then /I should be redirected to (.+) page/ do |page|
  expect(page).to be_displayed
end

Then 'I should be logged in the system' do
  AccountSummaryPage.on do
    expect(user_name_icon).to eql out(:@user).name
  end
end

# Then 'I should not be logged in the system' do
#   HomePage.on do
#     is_expected.to have_main_menu_section
#     expect(main_menu_section).to be_not_authenticated
#   end
# end
#
Then /I should see following text on (.+) page:/ do |page, message|
  page.on { expect(text).to include(message) }
end
