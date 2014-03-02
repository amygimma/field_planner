class CalendarController < ApplicationController
  def greenhouse
  end

  def field
  end

  def dates
  	@beds = current_user.beds.all()
  	render json: @beds
  end
end
