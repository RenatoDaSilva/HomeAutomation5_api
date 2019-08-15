# class Api::V1::DevicesController < ApplicationController
# end

class Api::V1::DevicesController < Api::V1::ApiController
 
    before_action :set_device, only: [:show, :update, :destroy]
    before_action :require_authorization!, only: [:show, :update, :destroy]
    
    # GET /api/v1/devices
    def index
      @devices = current_user.devices
      render json: @devices
    end
    
    # GET /api/v1/devices/1
    def show
      render json: @device
    end
    
    # POST /api/v1/devices
    def create
      @device = Device.new(device_params.merge(user: current_user))
      if @device.save
        render json: @device, status: :created
      else
        render json: @device.errors, status: :unprocessable_entity
      end
    end
    
    # PATCH/PUT /api/v1/devices/1
    def update
      if @device.update(device_params)
        render json: @device
      else
        render json: @device.errors, status: :unprocessable_entity
      end
    end
    
    # DELETE /api/v1/devices/1
    def destroy
      @device.destroy
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_device
#        @device = Device.find(params[:id])
        @device = Device.find_by_pin(params[:id])
      end
    
      # Only allow a trusted parameter "white list" through.
      def device_params
        params.require(:device).permit(:name, :pin, :state)
      end
    
      def require_authorization!
        unless current_user == @device.user
          render json: {}, status: :forbidden
        end
      end
   end
   