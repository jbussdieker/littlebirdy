module ApplicationHelper
  def admin?
    current_user.admin == true
  end
end
