RSpec.describe 'Schnitzelbank' do
  it 'renders them as HTML' do
    get '/schnitzelbank/2009'
    expect(last_response.body).to include('<h2>EM-Traum</h2>')
  end
end
