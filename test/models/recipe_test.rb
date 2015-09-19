require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "Bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: 'Chichen parm', summary: 'dis da best shizzle in town', 
      description: 'heat some ass, add some grass, wait 4 minutes and BOOM')
  end
  
  test 'recipe should be valid' do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
  
  test 'name length max 100' do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test 'name length min 5' do
    @recipe.name = "a" * 4
    assert_not @recipe.valid?
  end
  
  test 'summary should be present' do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
  
  test 'summary length min 10' do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test 'summary length max 150' do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test 'description should be present' do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
  test 'description min 20' do
    @recipe.description = "b" * 19
    assert_not @recipe.valid?
  end
  
  test 'description max 500' do
    @recipe.description = "b" * 501
    assert_not @recipe.valid?
  end
  
end