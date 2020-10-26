class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :remove, only: :edit

  def index
    @items = Item.order("created_at DESC")
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
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :postage_id, :province_id, :number_of_day_id, :price).merge(user_id: current_user.id)
  end

  def remove
    @item = Item.find(params[:id])
    if user_signed_in? && (current_user.id != @item.user.id)
      redirect_to root_path
    elsif current_user.blank?
      redirect_to new_user_session_path
    end
  end

end
