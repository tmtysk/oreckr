class Setting < ActiveRecord::Base
  attr_accessible :access_key_id, :s3_bucket_name, :secret_access_key

  def self.enabled
    Setting.first
  end

  after_create do
    Album.create(name: "Default Album")
  end
end
