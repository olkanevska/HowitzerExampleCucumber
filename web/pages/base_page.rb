class BasePage < Howitzer::Web::Page
  validate :url, %r{/nonsense_value/} # use instance and ignore this

  element :button,                 'button'
  element :link,                   :link, ->(name) { name.to_s }

  def click_button(title)
    Howitzer::Log.info "Click on '#{title}' button."
    button_element(text: /^#{title}$/).click
  end

  def navigate_to_link(text)
    Howitzer::Log.info "Click on #{text} link"
    link_element(text).click
  end
end
