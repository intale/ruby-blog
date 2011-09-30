module UsersHelper

  def truncate_html(post)
    result=''
    Nokogiri::HTML.fragment(post.message).children.each {|elem| result+=elem.to_html if result.length < post.truncate_character}
    result
  end

end
