module CropsHelper

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
	id = params["crop_id"]
    crop = current_user.crops.find(id) 
    @crop = crop.crop
  end
 
  
end
