class Photo < ActiveRecord::Base
  belongs_to :album
  attr_accessible :album, :album_id, :photo, :name
  mount_uploader :photo, PhotoUploader

  before_create :default_name

  def default_name
    self.name ||= File.basename(self.photo.filename, '.*').titleize if photo
  end

end
