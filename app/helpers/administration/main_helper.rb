module Administration::MainHelper
  def has_active_class?(href)
    current_page?(href) ? {:class => "active"} : []
  end
end