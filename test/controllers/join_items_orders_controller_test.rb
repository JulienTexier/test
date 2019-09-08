require 'test_helper'

class JoinItemsOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_items_order = join_items_orders(:one)
  end

  test "should get index" do
    get join_items_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_join_items_order_url
    assert_response :success
  end

  test "should create join_items_order" do
    assert_difference('JoinItemsOrder.count') do
      post join_items_orders_url, params: { join_items_order: {  } }
    end

    assert_redirected_to join_items_order_url(JoinItemsOrder.last)
  end

  test "should show join_items_order" do
    get join_items_order_url(@join_items_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_join_items_order_url(@join_items_order)
    assert_response :success
  end

  test "should update join_items_order" do
    patch join_items_order_url(@join_items_order), params: { join_items_order: {  } }
    assert_redirected_to join_items_order_url(@join_items_order)
  end

  test "should destroy join_items_order" do
    assert_difference('JoinItemsOrder.count', -1) do
      delete join_items_order_url(@join_items_order)
    end

    assert_redirected_to join_items_orders_url
  end
end
