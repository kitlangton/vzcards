class CardsController < ApplicationController
  before_action :find_card, only: [:edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
    @templates = Template.all
  end

  def create
    @card = Card.new(card_params)
    @card.instance_id = SiliconMan.new.instance(template_id: @card.template.ids_id,input: @card.name)
    if @card.save
      redirect_to cards_url
    else
      render :new
    end
  end

  def edit
  end

  def make
  end

  def update
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
    params.require(:card).permit(:name, :template_id)
  end
end
