class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :for_purchase, only: [:index]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address_line1, :address_line2, :city, :province_id, :tel).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def for_purchase
    @item = Item.find(params[:item_id])
    if (current_user.id == @item.user.id) || (@item.purchase.present?)
      redirect_to root_path
    end
  end

  def pay_item
    item = Item.find(order_params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
