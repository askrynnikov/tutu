module CarsHelper
  class CarsFormBuilder < ActionView::Helpers::FormBuilder
    def type_select(type)
      select :type, Car.types.map { |r| [r.humanize, r.camelcase] },
             {}, disabled: type != "Car"
    end
  end

  def sti_car_path(type = "car", car = nil, action = nil)
    send "#{format_sti(action, type, car)}_path", car
  end

  def format_sti(action, type, car)
    if action || car
      "#{format_action(action)}admin_#{type.underscore}"
    else
      "admin_" + type.underscore.pluralize.to_s
    end
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
