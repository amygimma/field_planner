class CropsController < ApplicationController
  #before_filter :authenticate_user!

  def show
    crop_id = params["id"]
    @crop = Crop.find(crop_id)
  end
  
  def create
    @user = current_user
    @crop = @user.crops.build(crop_params)
    @crop.save
    
    redirect_to @crop
  end
  
  def update
  end
  
  def destroy
  end
    
  def index 
    @crops = Crop.all()
  end
  
  def new
    if not user_signed_in?
      redirect_to new_user_session_path
    end
    @crop = Crop.new
  end
  
  def edit
  end
  
  private
    def crop_params  
      params.require(:crop).permit(:crop, :family, :greenhouse_time, :maturity_time, :notes)
    end

end
