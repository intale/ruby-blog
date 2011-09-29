module UsersHelper

  def truncate_html(html,post)
    result=''
    Nokogiri::HTML.fragment(html).children.each {|elem| result+=elem.to_html if result.length < post.truncate_character}
    result
  end

end
