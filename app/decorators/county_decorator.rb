class CountyDecorator < Draper::Decorator
  delegate_all

  def display_name
    object.name + ' ' + object.county_type
  end

  def search_display
    display_name + ', ' + object.state.decorate.display_name
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
