helpers do
  def stylesheet(s)
    s = asset_path(s + '.css') unless s =~ /^(https?:\/)?\//
    %(<link rel="stylesheet" href="#{s}" />)
  end

  def javascript(s)
    s = asset_path(s + '.js') unless s =~ /^(https?:\/)?\//
    %(<script src="#{s}"></script>)
  end

  include Sprockets::Helpers
end
