module UsersHelper

  def truncate_html(html)
    result=''
    Nokogiri::HTML.fragment(html).children.each {|elem| result+=elem.to_html if result.length <10}
    result
  end

end
