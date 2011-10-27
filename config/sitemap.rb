SitemapGenerator::Sitemap.default_host = "http://is-valid.org"
# if change this path crashed sitemap tab content in admin panel
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  Post.where(:status => false).each do |post|
    add show_post_comments_path(post), :lastmod => post.updated_at
  end
end

