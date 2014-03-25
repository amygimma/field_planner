class Bed < ActiveRecord::Base
  belongs_to :crop
  #after_initialize :normalize_dates trying to fix bug of not accepting date picker dates

  def normalize_dates
    self.frost_date = self.frost_date.strftime("%m-%d-%Y") unless self.frost_date == nil
    self.plant_date = self.plant_date.strftime("%m-%d-%Y") unless self.plant_date == nil
    self.harvest = self.harvest.strftime("%m-%d-%Y") unless self.harvest == nil
  end
 #before_save :normalize_card_number, if: "paid_with_card?"


  def create_dates
    
    initial_dates
    field_dates
    greenhouse_dates
    self.save!
  end

  def initial_dates
  	if self.harvest
      self.plant_date ||= self.harvest - (self.crop.maturity_time).days
    elsif self.frost_date
      self.plant_date ||= self.frost_date
    end
    self.save!
  end

  def field_dates
	  self.greenhouse_start  ||= self.plant_date - (self.crop.greenhouse_time).days
	  self.greenhouse_end = self.plant_date
	  self.harvest ||= self.plant_date + (self.crop.maturity_time).days
    self.save!
  end

  def greenhouse_dates
  	if self.greenhouse_start == self.greenhouse_end
      self.greenhouse_start = nil
      self.greenhouse_end = nil 
    end
    self.save!
  end
end
