require 'test_helper'

class TagTest < Test::Unit::TestCase
  subject { Factory(:tag) }
  should have_and_belong_to_many(:posts)

  should validate_presence_of :name
  should validate_uniqueness_of(:name)

end
