require 'test_helper'

class OwnedGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owned_game = owned_games(:one)
  end

  test "should get index" do
    get owned_games_url
    assert_response :success
  end

  test "should get new" do
    get new_owned_game_url
    assert_response :success
  end

  test "should create owned_game" do
    assert_difference('OwnedGame.count') do
      post owned_games_url, params: { owned_game: {  } }
    end

    assert_redirected_to owned_game_url(OwnedGame.last)
  end

  test "should show owned_game" do
    get owned_game_url(@owned_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_owned_game_url(@owned_game)
    assert_response :success
  end

  test "should update owned_game" do
    patch owned_game_url(@owned_game), params: { owned_game: {  } }
    assert_redirected_to owned_game_url(@owned_game)
  end

  test "should destroy owned_game" do
    assert_difference('OwnedGame.count', -1) do
      delete owned_game_url(@owned_game)
    end

    assert_redirected_to owned_games_url
  end
end
