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
end
