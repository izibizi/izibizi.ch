RSpec.describe '/mitglieder' do
  before do
    app.mitglieder = [{"id"=>"adriana-gunzenreiner",
      "name"=>"Adriana Gunzenreiner",
      "instrument"=>"Trompete",
      "rufname"=>"Adi",
      "hobbys"=>"mitm hund laufä",
      "dabei_seit"=>2015},
     {"id"=>"andrea-steingruber",
      "name"=>"Andrea Steingruber",
      "instrument"=>"Trompete",
      "rufname"=>"Andrea",
      "aufgabe"=>"Kassier, Schminkteam",
      "spruch"=>"So oder so!...",
      "hobbys"=>"Gugge, Familie, Ferien/Reisen, Fussball",
      "dabei_seit"=>2011},
     {"id"=>"andrea-zurbuchen",
      "name"=>"Andrea Zurbuchen",
      "instrument"=>"Trompete",
      "rufname"=>"Andrea, Andi",
      "hobbys"=>"Familie, schwimme, gugge, tanze, lese",
      "dabei_seit"=>2004},
     {"id"=>"andy-burri",
      "name"=>"Andy Burri",
      "instrument"=>"Pauke",
      "rufname"=>"Benscho",
      "spruch"=>"Nicht wenn du atmest, sondern wenn es dir den Atem raubt, lebst Du!",
      "hobbys"=>"Musik, verrückt sein",
      "dabei_seit"=>2015},
     {"id"=>"andy-thaler",
      "name"=>"Andy Thaler",
      "instrument"=>"Pauke",
      "rufname"=>"Thaler",
      "aufgabe"=>"Revisor",
      "spruch"=>"saufen, fressen und fffffolenzä",
      "dabei_seit"=>2005},
     {"id"=>"anina-ryffel",
      "name"=>"Anina Ryffel",
      "instrument"=>"Posaune",
      "rufname"=>"Anina",
      "aufgabe"=>"Kommunikationsförderung (blöd umeschnorre :) )",
      "spruch"=>"I glaub da lömer uus :P!",
      "hobbys"=>"Bei Ideen bitte melden!!",
      "dabei_seit"=>2015}]

    get '/mitglieder'
  end
  it 'renders successfuly' do
    expect(last_response).to be_ok
  end

  it 'renders all members' do
    expect(last_response.body).to include('Adriana')
    expect(last_response.body).to include('Anina')
  end
end
