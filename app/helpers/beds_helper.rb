module BedsHelper
  def greenhouse_date(bed)
    
  end
  
  def show_crop_for_bed(bed_id)
    @bed = Bed.find(bed_id)
    crop_id = @bed.crop_id
    @crop = Crop.find(crop_id)
  end

end
