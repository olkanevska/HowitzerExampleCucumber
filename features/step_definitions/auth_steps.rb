#############################################################
#                      PREREQUISITES                        #
#############################################################

####################################
#              ACTIONS             #
####################################

When 'I fill login form with test data' do
  @user = build(:user)
  param = { user_name: @user.name, password: @user.password }
  LoginPage.on { fill_form param }
end

When 'I fill login form with blank data' do
  param = {}
  LoginPage.on { fill_form(param) }
end

When 'I fill form with wrong password' do
  @user = build(:user)
  param = { user_name: @user.name, password: @user.password.to_s.reverse }
  LoginPage.on do
    fill_form(param)
  end
end

When 'I submit login form' do
  LoginPage.on { submit_form }
end

####################################
#              CHECKS              #
####################################
