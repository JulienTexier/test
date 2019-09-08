class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @user = current_user
    @email = current_user.email
    @amount = (current_user.cart.subtotal * 100).to_i
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    @order = Order.new(user: current_user, items: current_user.cart.items)

    
    respond_to do |format|
      if @order.save
      	current_user.cart.join_table_carts_items.each do |cart_item|
      		item = cart_item.item
      		quantity = cart_item.quantity
      		join = JoinItemsOrder.find_by(item: item, order: @order)
      		join.quantity = quantity
      		join.save
      	end
  			current_user.cart.items.clear
        format.html { redirect_to profile_order_path(current_user, @order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { flash.now[:error] = @order.errors.full_messages.to_sentence
        render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order
        flash[:success] = 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { flash.now[:error] = @order.errors.full_messages.to_sentence
        render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url
      flash[:success] = 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {})
    end
    
end