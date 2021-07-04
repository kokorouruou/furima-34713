class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:update, :show, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]


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
  end

  def edit
    if @item.purchase
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
    if @item.purchase
      redirect_to root_path
    end
  end 

  def destroy
    @item.destroy
    redirect_to root_path



    
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
      unless current_user.id == @item.user_id
        redirect_to action: :index
    end
  end
end
