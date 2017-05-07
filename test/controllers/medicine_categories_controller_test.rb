require 'test_helper'

class MedicineCategoriesControllerTest < ActionController::TestCase
  setup do
    @medicine_category = medicine_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicine_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicine_category" do
    assert_difference('MedicineCategory.count') do
      post :create, medicine_category: { category_id: @medicine_category.category_id, medicine_id: @medicine_category.medicine_id }
    end

    assert_redirected_to medicine_category_path(assigns(:medicine_category))
  end

  test "should show medicine_category" do
    get :show, id: @medicine_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicine_category
    assert_response :success
  end

  test "should update medicine_category" do
    patch :update, id: @medicine_category, medicine_category: { category_id: @medicine_category.category_id, medicine_id: @medicine_category.medicine_id }
    assert_redirected_to medicine_category_path(assigns(:medicine_category))
  end

  test "should destroy medicine_category" do
    assert_difference('MedicineCategory.count', -1) do
      delete :destroy, id: @medicine_category
    end

    assert_redirected_to medicine_categories_path
  end
end
