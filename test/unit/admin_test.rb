require 'test_helper'

class AdminTest < Test::Unit::TestCase

  should have_many(:posts)

  should validate_presence_of :email
  should validate_presence_of :username
  should validate_presence_of :nick
  should ensure_length_of(:username).is_at_least(3).is_at_most(200)
  should ensure_length_of(:email).is_at_least(3).is_at_most(200)
  should ensure_length_of(:nick).is_at_least(3).is_at_most(200)
  should validate_uniqueness_of(:username)
  should validate_uniqueness_of(:email)
  should validate_uniqueness_of(:nick)
  should validate_format_of(:email).with(Devise.email_regexp)
end

