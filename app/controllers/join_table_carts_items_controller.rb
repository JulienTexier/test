class JoinTableCartsItemsController < ApplicationController
  include CurrentCart
  before_action :set_joint_table_carts_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]
  before_action :authenticate_user!

  # GET /join_table_carts_items
  # GET /join_table_carts_items.json
  def index
    @join_table_carts_items = JoinTableCartsItem.all
  end

  # GET /join_table_carts_items/1
  # GET /join_table_carts_items/1.json
  def show
  end

  # GET /join_table_carts_items/new
  def new
    @joint_table_carts_item = JoinTableCartsItem.new
  end

  # GET /join_table_carts_items/1/edit
  def edit
  end

  # POST /join_table_carts_items
  # POST /join_table_carts_items.json
  def create
    @item = Item.friendly.find(params[:item_id])
    @joint_table_carts_item = current_user.cart.add_item(@item)

    respond_to do |format|
      if @joint_table_carts_item.save
      	#redirect_to @joint_table_carts_item.cart
         format.html { redirect_to @joint_table_carts_item.cart
         flash[:success] = 'Item added to cart.' }
         format.json { render :show, status: :created, location: @joint_table_carts_item }
         format.js {}
      else
         format.html { flash.now[:error] = @joint_table_carts_item.errors.full_messages.to_sentence
         render :new }
         format.json { render json: @joint_table_carts_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /join_table_carts_items/1
  # PATCH/PUT /join_table_carts_items/1.json
  def update
  	if params[:change] == "increase"
  		@joint_table_carts_item.quantity += 1
  	elsif params[:change] == "decrease" && @joint_table_carts_item.quantity > 1
  		@joint_table_carts_item.quantity -= 1
  	end
  	@joint_table_carts_item.save

  	respond_to do |format|
      format.html { redirect_to cart_path(current_user.cart) }
      format.js { }
    end
  end

  # DELETE /join_table_carts_items/1
  # DELETE /join_table_carts_items/1.json
  def destroy
    #@cart = Cart.find(session[:cart_id])
    @joint_table_carts_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(current_user.cart)
      flash[:success] = 'Join items order was successfully destroyed.' }
      format.js { }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joint_table_carts_item
      @joint_table_carts_item = JoinTableCartsItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joint_table_carts_item_params
      params.fetch(:joint_table_carts_item, {})
    end
end