class Bed < ActiveRecord::Base
  belongs_to :crop

  def create_gh_dates
    if self.harvest
      self.plant_date ||= self.harvest - (self.crop.maturity_time).days
    elsif self.frost_date
      self.plant_date ||= self.frost_date
    end
    self.greenhouse_start  ||= self.plant_date - (self.crop.greenhouse_time).days
    self.greenhouse_end = self.plant_date
    self.harvest ||= self.plant_date + (self.crop.maturity_time).days
    self.save
    if self.greenhouse_start == self.greenhouse_end
      self.greenhouse_start = nil
      self.greenhouse_end = nil 
    end
  end
end
