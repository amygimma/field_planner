class Crop < ActiveRecord::Base
  belongs_to :user
  before_save { self.crop = crop.capitalize }

end
