require 'active_support/core_ext'

class Api::V1::ReschedulesController < Api::V1::ApiController
 
  before_action :set_reschedule, only: [:show]
  before_action :require_authorization!, only: [:show]
  
  # GET /api/v1/reschedules/1
  def show
    if @schedule.rate.blank?
      @schedule.destroy
   else
    case @schedule.interval
    when 1
      @schedule.fire_on += @schedule.rate.minutes
    when 2
      @schedule.fire_on += @schedule.rate.hours
    else
      @schedule.fire_on += @schedule.rate.days
    end

    if @schedule.save
       render json: @schedule
      else
        render json: @schedule.errors, status: :unprocessable_entity
      end
   end
 end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reschedule
      @schedule = Schedule.find(params[:id])
    end
  
    def require_authorization!
      unless current_user == @schedule.user
        render json: {}, status: :forbidden
      end
    end
end
 