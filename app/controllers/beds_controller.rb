class BedsController < ApplicationController
  def show 
    bed_id = params["id"]
    @bed = Bed.find(bed_id) 
    @crop = Crop.find(@bed.crop_id)
  end

  def create
    crop_id = params["crop_id"]
    
    @crop = Crop.find(crop_id) 
    
    @bed = @crop.beds.build(bed_params)
    @bed.save
    
    redirect_to bed_path(@bed)
  end

  def update
  end

  def destroy
  end

  def index
    @beds = Bed.all()
    
    crop_id = params["crop_id"]
    
    @crop = Crop.find(crop_id) 
    
    @bed = @crop.beds.build(bed_params)
    @bed.save
    @crop = Crop.find(@bed.crop_id)
    redirect_to bed_path(@bed)
  end

  def new
   


  end

  def edit
  end
  
  def show_crop_for_bed(bed_id)
    @bed = Bed.find(bed_id)
    crop_id = @bed.crop_id
    crop = Crop.find(crop_id)
    @crop = crop.crop
    #raise @crop.beds
  end

  
  private
    def bed_params  
      params.require(:bed).permit(:bed, :frost_date, :crop_id)
    end
end
