class AdminMailer < ActionMailer::Base
  default from: "noreply@is-valid.org"

  def comment_notifier(comment,post)
    @admins = Admin.select(:email).subscribed.all.map(&:email)
    @post = Post.find_by_id(post)
    @comment = Comment.find_by_id(comment)
    mail(:to => @admins, :subject => "#{@comment.author} left a comment")
  end

end
