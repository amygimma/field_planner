class BedsController < ApplicationController
  def show 
    bed_id = params["id"]
    @bed = Bed.find(bed_id) 

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
    Crop.find(crop_id)
  end

  def new
   


  end

  def edit
  end
  
  private
    def bed_params  
      params.require(:bed).permit(:bed, :frost_date, :crop_id)
    end
end
