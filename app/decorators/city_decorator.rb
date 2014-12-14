class CityDecorator < Draper::Decorator
  delegate_all

  def display_name
    object.name
  end

  def display_capital_info
    t = ''
    if (city.state_capital)
      t += " (State capital)"
    end
    if (city.county_capital)
      t += " (County capital)"
    end
    t
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
