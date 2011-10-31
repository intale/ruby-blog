require 'test_helper'

class CommentTest < Test::Unit::TestCase

  should belong_to(:post)

  should validate_presence_of :post_id
  should validate_presence_of :content
  should validate_presence_of :author
  should ensure_length_of(:content).is_at_least(1).is_at_most(10000)
  should ensure_length_of(:author).is_at_least(3).is_at_most(20)
  should_not allow_mass_assignment_of(:post_id)

  context "Check author" do
    setup do
      @admin=Factory(:admin)
      @comment=Factory.build(:comment, :author => @admin.nick)
    end

    should "not validate with author name admin" do
      assert_equal(@comment.valid?, false)
    end
    should "validate with author name admin then admin in logged" do
        @comment.current_admin = @admin
        assert_equal(@comment.valid?, true)
    end
  end
end
