class Administration::SitemapController < Administration::MainController
  def index
    @files = []
    Dir.glob(Rails.root.to_s+"/public/sitemaps/*").each do |path|
      @files << {:name => File.basename(path), :date => File.ctime(path)}
    end

  end

  def create
    %x[rake 'sitemap:refresh']
    redirect_to administration_sitemap_index_path
  end
end
