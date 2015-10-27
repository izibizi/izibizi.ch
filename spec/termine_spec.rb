RSpec.describe 'Termine' do
  context 'no events' do
    before do
      app.termine = []
      get '/'
    end

    it 'renders a message if there are no termine' do
      expect(last_response.body).to include('Keine Termine anstehend')
    end
  end

  context 'with events' do
    before do
      app.termine = [{"datum"=>"Fr, 21.02.2014",
                      "gigs"=>
                       [{"was"=>"Beizentour", "wo"=>"Herisau"},
                        {"zeit"=>"20:00", "was"=>"Georgs"},
                        {"zeit"=>"20:45", "was"=>"Adler"},
                        {"zeit"=>"21:30", "was"=>"Bauhof"},
                        {"zeit"=>"22:15", "was"=>"Amadeus"},
                        {"zeit"=>"23:00", "was"=>"Bädli"},
                        {"zeit"=>"23:45", "was"=>"Yellow"},
                        {"zeit"=>"00:30", "was"=>"Rechberg"}]}]
      get '/'
    end

    it 'renders them!' do
      expect(last_response.body).to include('Beizentour')
      expect(last_response.body).to include('Herisau')
      expect(last_response.body).to include('Amadeus')
    end
  end
end
