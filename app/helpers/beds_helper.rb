module BedsHelper
  def generate_schedules
    @beds ||= []
    greenhouse_sort
    @dash = "-"
    field_sort
  end

 

  def greenhouse_sort
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
      @last_field_day = @fs.last
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
