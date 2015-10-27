module Helpers
  include Sprockets::Helpers

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
end
