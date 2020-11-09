require 'test_helper'

class WishedGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wished_game = wished_games(:one)
  end

  test "should get index" do
    get wished_games_url
    assert_response :success
  end

  test "should get new" do
    get new_wished_game_url
    assert_response :success
  end

  test "should create wished_game" do
    assert_difference('WishedGame.count') do
      post wished_games_url, params: { wished_game: {  } }
    end

    assert_redirected_to wished_game_url(WishedGame.last)
  end

  test "should show wished_game" do
    get wished_game_url(@wished_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_wished_game_url(@wished_game)
    assert_response :success
  end

  test "should update wished_game" do
    patch wished_game_url(@wished_game), params: { wished_game: {  } }
    assert_redirected_to wished_game_url(@wished_game)
  end

  test "should destroy wished_game" do
    assert_difference('WishedGame.count', -1) do
      delete wished_game_url(@wished_game)
    end

    assert_redirected_to wished_games_url
  end
end
