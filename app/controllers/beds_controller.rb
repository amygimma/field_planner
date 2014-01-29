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
    @bed = current_user.beds.find(params[:id])
    @bed.update(bed_params)
    redirect_to crops_path
  end

  def destroy
    bed_id = params["id"]
    @bed = current_user.beds.find(bed_id)
    
    Bed.destroy(@bed)
    
    redirect_to root_path
  end


  def index
    @beds = current_user.beds.all()
    @beds ||= []
    greenhouse_sort
    @dash = "-"
    field_sort
  end


  def new
  end

  def edit
    @bed = params["id"]
    @bed= current_user.beds.find(params[:id])
  end
  
  
  private
    def bed_params  
      params.require(:bed).permit(:bed, :user_id, :frost_date, :greenhouse_start, :greenhouse_end, :harvest, :use_frost, :total_days, :plant_date, :crop_id)
    end
end
