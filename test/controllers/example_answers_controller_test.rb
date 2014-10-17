require 'test_helper'

class ExampleAnswersControllerTest < ActionController::TestCase
  setup do
    @example_answer = example_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:example_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create example_answer" do
    assert_difference('ExampleAnswer.count') do
      post :create, example_answer: { example_answer: @example_answer.example_answer }
    end

    assert_redirected_to example_answer_path(assigns(:example_answer))
  end

  test "should show example_answer" do
    get :show, id: @example_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @example_answer
    assert_response :success
  end

  test "should update example_answer" do
    patch :update, id: @example_answer, example_answer: { example_answer: @example_answer.example_answer }
    assert_redirected_to example_answer_path(assigns(:example_answer))
  end

  test "should destroy example_answer" do
    assert_difference('ExampleAnswer.count', -1) do
      delete :destroy, id: @example_answer
    end

    assert_redirected_to example_answers_path
  end
end
