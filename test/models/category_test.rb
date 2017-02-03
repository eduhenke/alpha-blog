require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def setup
    @category = Category.new(name: "sports")
  end
  
  # Add more helper methods to be used by all tests here...
  test "category should be valid" do
    assert @category.valid?
  end
  
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
end
