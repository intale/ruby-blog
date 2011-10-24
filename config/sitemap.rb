SitemapGenerator::Sitemap.default_host = "http://www.is-valid.org"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  Post.find_each do |post|
    add show_post_comments_path(post), :lastmod => post.updated_at, :changefreq => 'daily'
  end
end

