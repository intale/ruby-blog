require 'test_helper'

class PostTest < Test::Unit::TestCase

  should have_many(:comments).dependent(:destroy)
  should have_and_belong_to_many(:tags)
  should belong_to(:admin)

  should validate_presence_of :admin_id
  should validate_presence_of :subject
  should validate_presence_of :message
  should validate_numericality_of :truncate_character
  should_not allow_mass_assignment_of(:admin_id)

  context "update post message" do
    setup do
      @post=Post.new(:message => '<html><head></head><body><div><f>bla bla</div></body></html></f>')
    end

    should "save only <body>...</body>" do
      assert_not_equal(@post.message,@post.update_post_message)
    end
  end

end

