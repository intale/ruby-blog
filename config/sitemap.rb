# Set the host name for URL creation
#SitemapGenerator::Sitemap.default_host = "http://www.example.com"
#
#SitemapGenerator::Sitemap.create do
# Put links creation logic here.
#
# The root path '/' and sitemap index file are added automatically for you.
# Links are added to the Sitemap in the order they are specified.
#
# Usage: add(path, options={})
#        (default options are used if you don't specify)
#
# Defaults: :priority => 0.5, :changefreq => 'weekly',
#           :lastmod => Time.now, :host => default_host
#
# Examples:
#
# Add '/articles'
#
#   add articles_path, :priority => 0.7, :changefreq => 'daily'
#
# Add all articles:
#
#   Article.find_each do |article|
#     add article_path(article), :lastmod => article.updated_at
#   end

# Set the host name for URL creation


#SitemapGenerator::Sitemap.default_host = @def_link
#@@links=SiteLinks.parse_link(@def_link,@@links)


#post_links =[]
#@@links.each do |link|
#   if link.start_with?("/post/")
#     post_links<<link
#end
#post(:filename => :subject) do


SitemapGenerator::Sitemap.default_host = "http://localhost:3000"

SitemapGenerator::Sitemap.create do

  Post.find_each do |post|
    add show_post_comments_path(post), :lastmod => post.updated_at, :changefreq => 'daily'
  end
end






