class MainMenuSection < Howitzer::Web::Section
  me '.nav-tabs'

  element :menu_item, :css, ->(t) { "[id='#{t}_tab']" }

  def choose_menu(text)
    Howitzer::Log.info "Open '#{text}' menu"
    text = text.downcase.tr(' ', '_')
    menu_item_element(text).click
  end
end
