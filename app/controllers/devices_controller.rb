class DevicesController < ApplicationController
  before_action :find_device, only: [:edit, :update, :destroy]

  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to devices_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @device.update(device_params)
      redirect_to devices_url
    else
      render :edit
    end
  end

  def destroy
    if @device.destroy
      redirect_to devices_url
    else
      render :index
    end
  end

  private

  def find_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name,:alias,:alias2,:manufacturer,:sku)
  end
end
