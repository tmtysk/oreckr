class Album < ActiveRecord::Base
  has_many :photos
  attr_accessible :name

  after_create do
    begin
      o = OreckrAws.instance
      obj = o.bucket.objects["#{self.id}/"]
      obj.write("")
    rescue
      self.destroy
    end
  end
end
