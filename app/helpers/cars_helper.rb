module CarsHelper
  def sti_car_path(type = "car", car = nil, action = nil)
    send "#{format_sti(action, type, car)}_path", car
  end

  def format_sti(action, type, car)
    action || car ?
                "#{format_action(action)}#{type.underscore}" :
                "#{type.underscore.pluralize}"
    # if type.nil?
    # action
    # else
    #   if car
    #             "#{format_action(action)}#{type.underscore}"
    #           else
    #             "#{type.underscore.pluralize}"
    #   end
    # end
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
