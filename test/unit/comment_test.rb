require 'test_helper'

class CommentTest < Test::Unit::TestCase

  should belong_to(:post)

  should validate_presence_of :post_id
  should validate_presence_of :content
  should validate_presence_of :author
  should ensure_length_of(:content).is_at_least(1).is_at_most(10000)
  should ensure_length_of(:author).is_at_least(3).is_at_most(20)
  should_not allow_mass_assignment_of(:post_id)
end
