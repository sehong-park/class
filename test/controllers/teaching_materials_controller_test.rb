require 'test_helper'

class TeachingMaterialsControllerTest < ActionController::TestCase
  setup do
    @teaching_material = teaching_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teaching_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teaching_material" do
    assert_difference('TeachingMaterial.count') do
      post :create, teaching_material: { description: @teaching_material.description, link: @teaching_material.link, name: @teaching_material.name }
    end

    assert_redirected_to teaching_material_path(assigns(:teaching_material))
  end

  test "should show teaching_material" do
    get :show, id: @teaching_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teaching_material
    assert_response :success
  end

  test "should update teaching_material" do
    patch :update, id: @teaching_material, teaching_material: { description: @teaching_material.description, link: @teaching_material.link, name: @teaching_material.name }
    assert_redirected_to teaching_material_path(assigns(:teaching_material))
  end

  test "should destroy teaching_material" do
    assert_difference('TeachingMaterial.count', -1) do
      delete :destroy, id: @teaching_material
    end

    assert_redirected_to teaching_materials_path
  end
end
