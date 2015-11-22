RSpec.describe 'Website' do
  before { get '/' }
  describe '/' do
    it 'gets the homepage' do
      expect(last_response).to be_ok
      expect(last_response.body).to include 'Willkommen'
    end
  end

  describe 'Navbar' do
    it 'has a navbar' do
      expect(last_response.body).to include 'navbar'
    end
    it 'highlights the current page' do
      exp = '<li class="active"><a href="http://example.org/">Home</a>'
      expect(last_response.body).to include exp
    end
  end

  it 'has sites with correct titles' do
    base_title = 'GM Izi bizi tini wini'
    data = {
      '/mitglieder' => 'Mitglieder',
      '/vhg' => 'VHG und Gugge-Tröffe',
      '/gaestebuch' => 'Gästebuch',
      '/schnitzelbank/2009' => 'Schnitzelbänke 2009',
      '/schnitzelbank/2012' => 'Schnitzelbänke 2012',
      '/schnitzelbank/2013' => 'Schnitzelbänke 2013',
      '/schnitzelbank/2015' => 'Schnitzelbänke 2015',
      '/impressum' => 'Impressum'
    }

    data.each do |path, subtitle|
      expected = "<title>#{subtitle} &middot; #{base_title}</title>"
      get path
      expect(last_response.body).to include(expected)
    end
  end

  it 'sets a description' do
    get '/'
    expect(last_response.body).to match(/<meta content="[^"]+" name="description" \/>/)
  end
end
