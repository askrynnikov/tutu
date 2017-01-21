module ApplicationHelper
  def navbar_in_out_link
    if user_signed_in?
      link_to "Выйти", destroy_user_session_path, method: :delete
    else
      link_to "Войти", new_user_session_path
    end
  end

  def navbar_admin_link
    link_to("Админка", admin_railway_stations_path) if user_signed_in? && current_user.admin?
  end
end
