require './config/sprockets'

RSpec.describe 'Assets' do
  let(:app) do
    Izibizi::AssetsEnvironment.get(File.expand_path('../..', __FILE__))
  end

  describe '/application.css' do
    it 'includes Bootstrap v3.3.x' do
      get '/application.css'
      expect(last_response.body).to include('Bootstrap v3.3.')
    end
  end

  describe '/application.js' do
    before { get '/application.js' }

    it 'includes Bootstrap' do
      expect(last_response.body).to include('Bootstrap')
    end
  end
end
