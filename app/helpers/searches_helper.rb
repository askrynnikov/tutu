module SearchesHelper
  def link_to_all_tickets
    return unless current_user

    path = current_user.admin? ? admin_tickets_path : tickets_path
    link_to('Список билетов', path)
  end
end
# link_to 'All tickets', current_user.admin? ? admin_tickets_path : tickets_path