module Helpers
  include Sprockets::Helpers

  # Page title
  def title(base)
    [@title, base].compact.join(' &middot; ')
  end

  # Prints a page title and sets the page title
  def page_header(title, subtitle = nil)
    @title = title
    subtitle = " <small>#{subtitle}</small>" if subtitle
    %(<h1 class="page-header">#{title}#{subtitle}</h1>)
  end

  # Menu Item
  def menu_link(path, text)
    active = request.path_info.eql?(path) ? ' class="active"' : ''
    %(<li#{active}><a href="#{url(path)}">#{text}</a></li>)
  end

  # Stylesheet path
  def stylesheet(s)
    s = asset_path(s + '.css') unless s =~ /^(https?:\/)?\//
    %(<link rel="stylesheet" href="#{s}" />)
  end

  # Javascript path
  def javascript(s)
    s = asset_path(s + '.js') unless s =~ /^(https?:\/)?\//
    %(<script src="#{s}"></script>)
  end

  def paging_params
    { after: params[:after], before: params[:before] }.reject { |_,v| v.nil? }
  end
end
