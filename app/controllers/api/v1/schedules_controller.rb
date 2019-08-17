# class Api::V1::SchedulesController < ApplicationController
# end

class Api::V1::SchedulesController < Api::V1::ApiController
 
  before_action :set_schedule, only: [:show, :update, :destroy]
  before_action :require_authorization!, only: [:show, :update, :destroy]
  
  # GET /api/v1/schedules
  def index
    @schedules = current_user.schedules
    render json: @schedules
  end
  
  # GET /api/v1/schedules/1
  def show
    render json: @schedule
  end
  
  # POST /api/v1/schedules
  def create
    @schedule = Schedule.new(schedule_params.merge(user: current_user))
    if @schedule.save
      render json: @schedule, status: :created
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /api/v1/schedules/1
  def update
    if @schedule.update(schedule_params)
      render json: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /api/v1/schedules/1
  def destroy
    @schedule.destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def schedule_params
      params.require(:schedule).permit(:pin, :state, :fire_on)
    end
  
    def require_authorization!
      unless current_user == @schedule.user
        render json: {}, status: :forbidden
      end
    end
 end
 