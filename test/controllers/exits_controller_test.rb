require 'test_helper'

class ExitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exit = exits(:one)
  end

  test "should get index" do
    get exits_url
    assert_response :success
  end

  test "should get new" do
    get new_exit_url
    assert_response :success
  end

  test "should create exit" do
    assert_difference('Exit.count') do
      post exits_url, params: { exit: { amount: @exit.amount, comment: @exit.comment, date: @exit.date, stock_id: @exit.stock_id } }
    end

    assert_redirected_to exit_url(Exit.last)
  end

  test "should show exit" do
    get exit_url(@exit)
    assert_response :success
  end

  test "should get edit" do
    get edit_exit_url(@exit)
    assert_response :success
  end

  test "should update exit" do
    patch exit_url(@exit), params: { exit: { amount: @exit.amount, comment: @exit.comment, date: @exit.date, stock_id: @exit.stock_id } }
    assert_redirected_to exit_url(@exit)
  end

  test "should destroy exit" do
    assert_difference('Exit.count', -1) do
      delete exit_url(@exit)
    end

    assert_redirected_to exits_url
  end
end
