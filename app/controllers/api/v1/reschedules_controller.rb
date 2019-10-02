require 'active_support/core_ext'
require 'date'

class Api::V1::ReschedulesController < Api::V1::ApiController
 
  before_action :set_reschedule, only: [:show]
  before_action :require_authorization!, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  
  # GET /api/v1/reschedules
  def index
    @schedules = current_user.schedules
    render json: @schedules.where("fire_on <= ?", DateTime.current.in_time_zone('Brasilia')).order("fire_on")
  end
    
  # GET /api/v1/reschedules/1
  def show
    if @schedule.rate.blank?
      @schedule.destroy
    else
      do_reschedule
    end

    bring_next_schedule
  end
  
  private
 
  def set_reschedule
    @schedule = Schedule.find(params[:id])||nil
  end
  
  def require_authorization!
    unless current_user == @schedule.user
      render json: {}, status: :forbidden
    end
  end

  def handle_record_not_found
    bring_next_schedule
  end
    
  def bring_next_schedule
    @schedules = current_user.schedules
    render json: @schedules.where("fire_on <= ?", DateTime.current.in_time_zone('Brasilia')).order("fire_on").first
  end
    
  def do_reschedule
    case @schedule.interval
    when 1
      @schedule.fire_on += @schedule.rate.minutes
    when 2
      @schedule.fire_on += @schedule.rate.hours
    else
      @schedule.fire_on += @schedule.rate.days
    end

    if !@schedule.save
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end
end
 