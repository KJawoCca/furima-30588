class PurchasesController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address_line1, :address_line2, :city, :province_id, :tel).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
