class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    case current_user.roles.first.name
      when 'admin'
        users_path
      else
        root_path
    end
  end
  
  helper_method :date_formatted
  def date_formatted(datetime)
    return nil if datetime.blank?
    datetime.strftime("%m/%d/%Y")
  end
  
  private
  def set_timezone
    Time.zone = cookies["time_zone"]
  end

  
end