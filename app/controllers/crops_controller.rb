class CropsController < ApplicationController
  before_filter :authenticate_user!

  def show
    crop_id = params["id"]
    @crop = Crop.find(crop_id)
    
  end
  
  def create
    @user = current_user
    @crop = @user.crops.build(crop_params)
    @crop.save
    
    redirect_to crops_path
  end
  
  def update
    crop_id = params["id"]
    
    @crop = Crop.find(params[:id])
  
    @crop.update(crop_params)
    
    redirect_to crops_path
  end
  
  def destroy
    
    crop_id = params["id"]
    @crop = Crop.find(crop_id)
    
    Crop.destroy(crop_id)
    
    redirect_to crops_path
  end
    
  def index
    @crop = Crop.new 
    @crops = current_user.crops.all()
  end
  
  def new
    @crop = Crop.new
    @crops = current_user.crops.all()
  end
  
  def edit
     @user = current_user
     @crop_id = params["id"]
     @crop = Crop.find(params[:id])
  end
  
  private
    def crop_params  
      params.require(:crop).permit(:crop, :family, :greenhouse_time, :maturity_time, :notes)
    end

end
