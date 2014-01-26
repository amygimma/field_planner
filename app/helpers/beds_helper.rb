module BedsHelper

   def create_gh_dates
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

  def greenhouse_sort
  	#@gs ||= []
  	if @beds == []
		@gs = [0000-00-00]
   	else
    @gs = greenhouse_starts.sort
    @first_day = @gs.first
    @last_day = @gs.last
    @n = @first_day
end
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
  

  def field_sort
  	#@fs ||= []
    if @beds == []
    	@fs = [0000-00-00]
   	else
   	@fs = field_starts.sort
    @first_field_day = @fs.first
    @fn = @first_field_day
   	end
  end

  def field_starts
    @fbeds = current_user.beds.all()
    @fbeds.map do |bed|
      @fstarts ||= []
      next if bed.plant_date == nil
      @fstarts << bed.plant_date.to_date
    end
    @fstarts
  end

end
