class Crop < ActiveRecord::Base
  belongs_to :user
  has_many :beds
  before_save { self.crop = crop.capitalize }

end
