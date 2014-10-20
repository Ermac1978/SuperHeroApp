require 'test_helper'

class SuperHerosControllerTest < ActionController::TestCase
  setup do
    @super_hero = super_heros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:super_heros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create super_hero" do
    assert_difference('SuperHero.count') do
      post :create, super_hero: { hero_name: @super_hero.hero_name, powers: @super_hero.powers, secret_identity: @super_hero.secret_identity, team: @super_hero.team }
    end

    assert_redirected_to super_hero_path(assigns(:super_hero))
  end

  test "should show super_hero" do
    get :show, id: @super_hero
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @super_hero
    assert_response :success
  end

  test "should update super_hero" do
    patch :update, id: @super_hero, super_hero: { hero_name: @super_hero.hero_name, powers: @super_hero.powers, secret_identity: @super_hero.secret_identity, team: @super_hero.team }
    assert_redirected_to super_hero_path(assigns(:super_hero))
  end

  test "should destroy super_hero" do
    assert_difference('SuperHero.count', -1) do
      delete :destroy, id: @super_hero
    end

    assert_redirected_to super_heros_path
  end
end
