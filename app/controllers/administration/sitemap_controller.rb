class Administration::SitemapController < Administration::MainController
  def index
    @files = Dir[Rails.public_path + '/sitemaps/' + '*.xml.gz'].map {|x| {:name => File.basename(x), :date => File.ctime(x)}}
  end

  def create
    %x[rake 'sitemap:refresh']
    redirect_to administration_sitemap_index_path, :notice => 'Successfully generated...'
  end
end
