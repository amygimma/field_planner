class CropsController < ApplicationController
  include CropsHelper
  before_filter :authenticate_user!

  def show
    @crop = current_user.crops.find(crop_id) 
    @bed = Bed.new
  end
  
  def create
    @user = current_user
    @crop = @user.crops.build(crop_params)
    @crop.save
        
    redirect_to crops_path
  end
  
  def update
    @crop = current_user.crops.find(params[:id])
    @crop.update(crop_params) 
    redirect_to crops_path
  end
  
  def destroy
    
    @crop = Crop.find(crop_id)
    
    Crop.destroy(crop_id)
    
    redirect_to crops_path
  end
    
  def index
    redirect_to crops_path if not 
    @crop = Crop.new
    @crops = current_user.crops.all()
    @beds = Bed.all()
    redirect_to crops_path if @beds.nil?
    @bedcrop
  end
  
  def new
    @crop = Crop.new
    @crops = current_user.crops.all()
  end
  
  def edit
     @user = current_user
     @crop = current_user.crops.find(params[:id])
  end
  
  
  
  private
    def crop_params  
      params.require(:crop).permit(:crop, :id, :family, :greenhouse_time, :maturity_time, :notes, beds_attributes: [:bed, :user_id, :frost_date, :greenhouse_start, :greenhouse_end, :harvest, :use_frost, :total_days, :plant_date, :crop_id])
    end

end
