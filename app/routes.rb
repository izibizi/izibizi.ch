get('/') { slim :index }

# Redirect old member links
get('/mitglieder/*') do
  redirect to('/mitglieder'), 301
end

# Remove trailing slashes from routes
get('*/') do |path|
  redirect to(path), 301
end

%i{gaestebuch links mitglieder vhg passiv impressum}.each do |p|
  get("/#{p}") { slim p }
end

get '/bilder' do
  data = settings.facebook.albums(after: params[:after])
  @albums = data['data']
  slim :'bilder/index'
end

get('/schnitzelbank/:id') do
  @year = params[:id]
  pass unless settings.schnitzelbank.has_key?(@year)
  @title = "Schnitzelbänke #{@year}"
  @description = "Die Schnitzelbänke des Jahres #{@year}"
  @content = settings.schnitzelbank[@year]
  slim :schnitzelbank
end
