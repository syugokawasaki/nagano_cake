class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items

  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def create
    cart_items = current_customer.cart_items
    # 分岐文
    cart_item = cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item.present?
       total = cart_item.amount + params[:cart_item][:amount].to_i
       cart_item.update(amount: total)

    else
      cart_item = CartItem.new(cart_item_params)
    # cart_item = CartItem.new
    # cart_item.amount = params[:cart_item][:amount]
    # cart_item.item_id = params[:cart_item][:item_id]
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
      redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    # ?"cart_item"=>{"amount"=>"2", "item_id"=>"1"}}
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
