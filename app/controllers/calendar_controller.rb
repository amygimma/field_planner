class CalendarController < ApplicationController
  def greenhouse
  end

  def field
  end

  def combined
  end

  def gh_dates
  	@beds = current_user.beds.all()
  	@bedDates = []
  	@beds.each do |bed|
  		crop = bed.crop.crop
  		next if bed.greenhouse_start == nil
  		dates = {
  			"title" => "GH Start: #{crop}",
  			"start" => bed.greenhouse_start, 
  			url: bed_path(bed)
  		}
  		@bedDates << dates
  		dates = {
  			"title" => "GH End: #{crop}",
  			"start" => bed.greenhouse_end, 
  			url: bed_path(bed)
  		}
  		@bedDates << dates
  	end
  	@bedDates
  	render json: @bedDates
  end

  def field_dates
  	@beds = current_user.beds.all()
  	@bedDates = []
  	@beds.each do |bed|
  		crop = bed.crop.crop
  		next if bed.greenhouse_start == nil
  		dates = {
  			"title" => "Plant: #{crop.pluralize} ",
  			"start" => bed.plant_date, 
  			url: bed_path(bed)
  		}
  		@bedDates << dates
  		dates = {
  			"title" => "Harvest: #{crop.pluralize}",
  			"start" => bed.harvest, 
  			url: bed_path(bed)
  		}
  		@bedDates << dates
  	end
  	@bedDates
  	render json: @bedDates
  end

end
