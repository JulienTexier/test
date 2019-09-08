require "application_system_test_case"

class JoinItemsOrdersTest < ApplicationSystemTestCase
  setup do
    @join_items_order = join_items_orders(:one)
  end

  test "visiting the index" do
    visit join_items_orders_url
    assert_selector "h1", text: "Join Items Orders"
  end

  test "creating a Join items order" do
    visit join_items_orders_url
    click_on "New Join Items Order"

    click_on "Create Join items order"

    assert_text "Join items order was successfully created"
    click_on "Back"
  end

  test "updating a Join items order" do
    visit join_items_orders_url
    click_on "Edit", match: :first

    click_on "Update Join items order"

    assert_text "Join items order was successfully updated"
    click_on "Back"
  end

  test "destroying a Join items order" do
    visit join_items_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Join items order was successfully destroyed"
  end
end
