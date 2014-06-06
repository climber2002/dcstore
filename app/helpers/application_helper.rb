module ApplicationHelper

  # Creates a <li> item for the nav bar, if the current controller's name
  # equals controller_name, the <li> will add 'active' class
  def nav_list_item_for_controller controller_name, path
    content_tag(:ul, class: 'nav navbar-nav') do
      li_options = {}
      li_options[:class] = 'active' if controller.controller_name == controller_name

      content_tag(:li, li_options) do 
        link_to controller_name.humanize, path
      end
    end
  end
end
