require_relative 'base_page'
class LoginPage < BasePage
  path '/login.html'
  validate  :title, /\AZero - Log in\z/

  element   :user_name, '#user_login'
  element   :password,  '#user_password'
  element   :sign_in,   '[value="Sign in"]'

  def fill_form(user_data_hash)
    Howitzer::Log.info 'Fill in Login Form with data:' \
               "#{user_data_hash}"
    user_name_element.set(user_data_hash[:user_name])
    password_element.set(user_data_hash[:password])
  end

  def submit_form
    Howitzer::Log.info 'Submit Login Form'
    sign_in_element.click
  end
end
