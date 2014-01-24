module BedsHelper
   def create_dates
    crop_id = params["crop_id"]
    
    @crop = current_user.crops.find(crop_id) 

     if @bed.harvest
      @bed.plant_date ||= @bed.harvest - (@crop.maturity_time).days
    elsif @bed.frost_date
      @bed.plant_date ||= @bed.frost_date
    end
      @bed.greenhouse_start  ||= @bed.plant_date - (@crop.greenhouse_time).days
      @bed.greenhouse_end = @bed.plant_date
      @bed.harvest ||= @bed.plant_date + (@crop.maturity_time).days
    
    @bed.save

  end

    def greenhouse_starts
    @beds = current_user.beds.all()

    @beds.map do |bed|
      @starts ||= []
      next if bed.greenhouse_start == nil
      @starts << bed.greenhouse_start.to_date
    end
    @starts
  end
  
  def generate_greenhouse_days
    @gs = greenhouse_sort
    @n = first_day
    100.times do |day|
      @n ||= @n + 1.day
    end
  end
  
  def greenhouse_sort
    @gs = greenhouse_starts.sort
    @first_day = @gs.first
    @last_day = @gs.last
    @n = @first_day
  end
  
  def crop_name
    crop_id = @bed.crop_id
    crop = Crop.find(crop_id)
    @crop = crop.crop
  end
end
