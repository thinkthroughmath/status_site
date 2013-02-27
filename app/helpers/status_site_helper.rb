module StatusSiteHelper
  def nav_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end
end
