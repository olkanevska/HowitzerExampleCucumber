class TopNavMenuSection < Howitzer::Web::Section
  me '.navbar-fixed-top'

  element :account,   '.dropdown-toggle'
  element :button,    'button'

  def user_name_icon
    account_elements.last.text
  end

  def open_profile_dropdown
    Howitzer::Log.info 'Open Profile dropdown menu'
    account_elements.last.click
  end

  def not_authenticated?(text = 'Signin')
    has_button_element?(text: text)
  end
end
