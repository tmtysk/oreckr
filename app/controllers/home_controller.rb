class HomeController < ApplicationController
  def index
    if Setting.enabled
      redirect_to album_photos_path(Album.first)
    else
      redirect_to new_setting_path
    end
    return false
  end
end
