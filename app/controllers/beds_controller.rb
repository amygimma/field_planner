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
    @bed.save
    
    @bed.greenhouse_start  = @bed.plant_date - (@crop.greenhouse_time).days
    @bed.save
    redirect_to bed_path(@bed)
  end

  def update
  end

  def destroy
  end

  def index
    @beds = Bed.all()
    Crop.find(crop_id)
  end

  def new
   


  end

  def edit
  end
  

  private
    def bed_params  
      params.require(:bed).permit(:bed, :frost_date, :greenhouse_start, :greenhouse_end, :harvest, :use_frost, :total_days, :plant_date, :crops_id)
    end
end
