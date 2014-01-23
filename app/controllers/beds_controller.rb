class BedsController < ApplicationController
#needs refacroting, make helpers for crop_id and greenhouse_start/end, etc"
  def show 
    bed_id = params["id"]
    @bed = Bed.find(bed_id) 
    crop_id = @bed.crop_id
    @crop = Crop.find(crop_id)
  end

  def create
    crop_id = params["crop_id"]
    
    @crop = Crop.find(crop_id) 
    @bed = @crop.beds.build(bed_params)
    @bed.save!
    if @bed.harvest
      @bed.plant_date ||= @bed.harvest - (@crop.maturity_time).days
    elsif @bed.frost_date
      @bed.plant_date ||= @bed.frost_date
    end
      @bed.greenhouse_start  ||= @bed.plant_date - (@crop.greenhouse_time).days
      @bed.greenhouse_end = @bed.plant_date
      @bed.harvest ||= @bed.plant_date + (@crop.maturity_time).days
    
    @bed.save
    redirect_to bed_path(@bed)
  end

  def update
  end

  def destroy
    bed_id = params["id"]
    @bed = Bed.find(bed_id)
    
    Bed.destroy(bed_id)
    
    redirect_to root_path
  end

  def index
    @beds = Bed.all()
    #@start = @beds.greenhouse_start.sort.first
    @gs = greenhouse_sort
    @dash = "-"
  end

  def new
  end

  def edit
  end
  
  def greenhouse_starts
    @beds = Bed.all()
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
  private
    def bed_params  
      params.require(:bed).permit(:bed, :frost_date, :greenhouse_start, :greenhouse_end, :harvest, :use_frost, :total_days, :plant_date, :crops_id)
    end
end
