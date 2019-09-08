class JoinItemsOrdersController < ApplicationController
  before_action :set_join_items_order, only: [:show, :edit, :update, :destroy]

  # GET /join_items_orders
  # GET /join_items_orders.json
  def index
    @join_items_orders = JoinItemsOrder.all
  end

  # GET /join_items_orders/1
  # GET /join_items_orders/1.json
  def show
  end

  # GET /join_items_orders/new
  def new
    @join_items_order = JoinItemsOrder.new
  end

  # GET /join_items_orders/1/edit
  def edit
  end

  # POST /join_items_orders
  # POST /join_items_orders.json
  def create
    @join_items_order = JoinItemsOrder.new(join_items_order_params)

    respond_to do |format|
      if @join_items_order.save
        format.html { redirect_to @join_items_order
        flash[:success] = 'Join items order was successfully created.' }
        format.json { render :show, status: :created, location: @join_items_order }
      else
        format.html { flash.now[:error] = @join_items_order.errors.full_messages.to_sentence
        render :new }
        format.json { render json: @join_items_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /join_items_orders/1
  # PATCH/PUT /join_items_orders/1.json
  def update
    respond_to do |format|
      if @join_items_order.update(join_items_order_params)
        format.html { redirect_to @join_items_order
        flash[:success] = 'Join items order was successfully updated.' }
        format.json { render :show, status: :ok, location: @join_items_order }
      else
        format.html { flash.now[:error] = @join_items_order.errors.full_messages.to_sentence
        render :edit }
        format.json { render json: @join_items_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /join_items_orders/1
  # DELETE /join_items_orders/1.json
  def destroy
    @join_items_order.destroy
    respond_to do |format|
      format.html { redirect_to join_items_orders_url
      flash[:success] = 'Join items order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_items_order
      @join_items_order = JoinItemsOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def join_items_order_params
      params.fetch(:join_items_order, {})
    end
end