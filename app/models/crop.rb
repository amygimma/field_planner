class Crop < ActiveRecord::Base
  #attr_accessible :crop, :id, :greenhouse_time, :maturity_time
  
  belongs_to :user
  has_many :beds
  #before_save { unless self.crop= nil self.crop = crop.capitalize }

end
