class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.save
    if @item.quantity < 1
      flash[:alert] = "Incorrect Quantity"
      redirect_to products_path
    end
    session[:order_id] = @order.id
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js { render 'products/create' }
    end
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    # binding.pry
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js { render 'carts/destroy_item' }
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end

def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to '/'
  else
    flash[:alert] = "Incorrect Username / Password. Try Again"
    redirect_to '/sign_in'
  end
end
