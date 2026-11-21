require "test_helper"

class AnimalsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @admin = users(:two)
    @animal = animals(:one)
    @other_animal = animals(:two)
  end

  test "guest can get index, show, and about" do
    get animals_url
    assert_response :success

    get animal_url(@animal)
    assert_response :success

    get about_url
    assert_response :success
  end

  test "guest is redirected when trying to create animal" do
    get new_animal_url
    assert_redirected_to new_user_session_url
  end

  test "signed in user can create and manage own animal" do
    sign_in @user

    get profile_url
    assert_response :success

    assert_difference("Animal.count") do
      post animals_url, params: { animal: { age: 2, description: "Playful dog looking for home", name: "Buddy", species: "Dog", status: "Шукають дім" } }
    end
    assert_redirected_to animal_url(Animal.last)

    get edit_animal_url(@animal)
    assert_response :success

    patch animal_url(@animal), params: { animal: { name: "Bobik Updated" } }
    assert_redirected_to animal_url(@animal)

    assert_difference("Animal.count", -1) do
      delete animal_url(@animal)
    end
    assert_redirected_to animals_url
  end

  test "regular user cannot edit other user's animal or destroy all" do
    sign_in @user

    get edit_animal_url(@other_animal)
    assert_redirected_to animals_url

    delete destroy_all_animals_url
    assert_redirected_to animals_url
    assert_operator Animal.count, :>, 0
  end

  test "admin can edit any animal and destroy all" do
    sign_in @admin

    get edit_animal_url(@animal)
    assert_response :success

    delete destroy_all_animals_url
    assert_equal 0, Animal.count
    assert_redirected_to animals_url
  end
end
