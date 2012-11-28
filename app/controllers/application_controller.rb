class ApplicationController < ActionController::Base
  protect_from_forgery

  def setting_required
    if Setting.enabled
      @aws = OreckrAws.instance
    else
      redirect_to new_setting_path
      return false
    end
  end
end
