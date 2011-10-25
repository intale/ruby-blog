SitemapGenerator::Sitemap.default_host = "http://is-valid.org"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  Post.where(:status => false).each do |post|
    add show_post_comments_path(post), :lastmod => post.updated_at
  end
end

