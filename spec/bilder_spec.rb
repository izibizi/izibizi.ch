RSpec.describe 'Bilder' do
  describe 'index' do
    before do
      stub_request(:get, %r{^https://graph.facebook.com/gmizibizi/albums?})
        .to_return(web_response('albums'))
      get '/bilder'
    end

    it 'has the correct title' do
      expect(last_response.body).to include('<title>Bilder')
    end

    it 'displays the 3 Albums' do
      expect(last_response.body).to include 'Album 1'
      expect(last_response.body).to include 'Album 2'
      expect(last_response.body).to include 'Album 3'
    end

    it 'does not display cover photo albums' do
      expect(last_response.body).to_not include 'Cover Photos'
    end
  end
end
