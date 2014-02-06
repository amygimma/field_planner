class Crop < ActiveRecord::Base
  #attr_accessible :crop, :id, :greenhouse_time, :maturity_time
  
  belongs_to :user
  has_many :beds, dependent: :destroy
  #before_save { unless self.crop= nil self.crop = crop.capitalize }
	after_initialize :init

  def init
    self.greenhouse_time  ||= 0  #set greenhouse time to 0 for bed/schedule generation
  end
end
