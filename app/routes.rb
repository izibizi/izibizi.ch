get('/') { slim :index }

%i{gaestebuch bilder links mitglieder vhg passiv}.each do |p|
  get("/#{p}") { slim p }
end

get('/schnitzelbank/:id') do
  pass unless settings.schnitzelbank.has_key?(params[:id])
  slim :schnitzelbank, locals: {
    title: params[:id],
    content: settings.schnitzelbank[params[:id]]
  }
end
