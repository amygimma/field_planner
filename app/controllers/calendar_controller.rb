class CalendarController < ApplicationController
  def greenhouse
  end

  def field
  end

  def dates
  	@beds = current_user.beds.all()
  	@bedDates = []
  	@beds.each do |bed|
  		dates = {
  			"title" => bed.bed,
  			"start" => bed.greenhouse_start 
  		}
  		@bedDates << dates
  	end
  	@bedDates
  	render json: @bedDates
  end
end
