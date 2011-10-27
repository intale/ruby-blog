class Administration::SitemapController < Administration::MainController
  def index
    parse_path = Rails.public_path + '/sitemaps/' + '*.xml.gz'
    @files = Dir[parse_path].map {|x| {:name => File.basename(x), :date => File.ctime(x)}}
  end

  def create
    %x[rake 'sitemap:refresh']
    redirect_to administration_sitemap_index_path, :notice => 'Successfully generated...'
  end
end
