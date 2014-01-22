class Bed < ActiveRecord::Base
  #attr_accessible :bed, :id, :crop_id, :greenhouse_start, :greenhouse_end, :harvest
  
  belongs_to :crop
end
