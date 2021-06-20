class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :set_item, only: [:update, :move_to_index]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end 

  private

  def item_params
    params.require(:item).permit(:title, :text, :price, :image, :category_id, :product_condition_id, :delivery_charge_id,
                                 :prefecture_id, :day_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
      @item = Item.find(params[:id])
      unless current_user.id == @item.user_id
        redirect_to action: :index
    end
  end
end
