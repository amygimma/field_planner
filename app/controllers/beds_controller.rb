class BedsController < ApplicationController
  before_filter :authenticate_user!
  include BedsHelper

  def show 
    bed_id = params["id"]
    @bed = Bed.find(bed_id) 
    crop_id = @bed.crop_id
    @crop = Crop.find(crop_id)
  end

  def create
    crop_id = params["crop_id"]
    
    @crop = current_user.crops.find(crop_id) 
    @bed = @crop.beds.build(bed_params)
    @bed.save!
  
    create_gh_dates
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
    @beds = current_user.beds.all()
    @gs = greenhouse_sort
    @dash = "-"
    
  end


  def new
  end

  def edit
  end
  
  
  private
    def bed_params  
      params.require(:bed).permit(:bed, :user_id, :frost_date, :greenhouse_start, :greenhouse_end, :harvest, :use_frost, :total_days, :plant_date, :crop_id)
    end
end
