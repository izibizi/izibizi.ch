get('/') { slim :index }

%i{gaestebuch bilder links mitglieder vhg passiv}.each do |p|
  get("/#{p}") { slim p }
end

get('/schnitzelbank/:id') do
  @year = params[:id]
  pass unless settings.schnitzelbank.has_key?(@year)
  @title = "Schnitzelbänke #{@year}"
  @description = "Die Schnitzelbänke des Jahres #{@year}"
  @content = settings.schnitzelbank[@year]
  slim :schnitzelbank
end
