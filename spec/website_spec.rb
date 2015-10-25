RSpec.describe 'Website' do
  describe '/' do
    it 'gets the homepage' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include 'Willkommen'
    end
  end
end
