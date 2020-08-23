require "test_helper"

class RecipeControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get "/recipe/"
    assert_response :success
  end

  test "should get 404 on unknown recipe" do
    get "/recipe/1"
    assert_response :missing
  end

  test "should get 200 on existing recipe" do
    id = Recipe.first.id
    get "/recipe/#{id}"
    assert_response :success
  end
end
