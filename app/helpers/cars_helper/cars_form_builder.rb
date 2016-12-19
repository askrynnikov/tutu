class CarsFormBuilder < ActionView::Helpers::FormBuilder
  def type_select(type)
    select :type, Car.types.map { |r| [r.humanize, r.camelcase] },
           {}, disabled: type != "Car"
    # redirect_to :back
    # redirect_back(fallback_location: fallback_location)
    # render action: "car_show"
    # <%= f.select :type, Car.types.map {|r| [r.humanize, r.camelcase]},
    #                {}, disabled: @type!= "Car" %>
  end
end
