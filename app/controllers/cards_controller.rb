require 'open-uri'
class CardsController < ApplicationController
  before_action :find_card, only: [:edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
    @templates = Template.all
  end

  def new_from_device
    @device = Device.find(params[:id])
    @card = Card.new
    @templates = Template.all
  end

  def create
    @card = Card.new(card_params)
    silicon = SiliconMan.new
    @card.instance_id = silicon.new.create_instance(template_id: @card.template.ids_id,input: @card.variables)
    @card.image_from_url(silicon.pdf_url)
    if @card.save
      redirect_to cards_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    @card.image_from_url(:image, open("http://165.254.199.10/sdsession/7f48a651-8393-487f-aa48-70e9b197054e/s1instance/#{@card.instance_id}/output/S1PDF"))
    if @card.update(card_params)
      redirect_to cards_url
    else
      render :new
    end
  end

  def destroy
    if @card.destroy
      redirect_to cards_url
    else
      render :index
    end
  end

  private

  def find_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :template_id, :alias, :alias2, :two_year_price, :full_retail_price, :effective_date, :device_id)
  end
end
