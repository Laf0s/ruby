require "test_helper"

class AnimalTest < ActiveSupport::TestCase
  test "validates presence and length of key fields" do
    animal = Animal.new
    assert_not animal.valid?
    assert_includes animal.errors[:name], "can't be blank"
    assert_includes animal.errors[:species], "can't be blank"
    assert_includes animal.errors[:description], "can't be blank"
    assert_includes animal.errors[:status], "can't be blank"
  end

  test "validates age numericality and status inclusion" do
    animal = Animal.new(
      name: "Rex",
      species: "Dog",
      age: -1,
      status: "Invalid",
      description: "Valid long enough description",
      user: users(:one)
    )
    assert_not animal.valid?
    assert animal.errors[:age].any?
    assert animal.errors[:status].any?
  end
end
