get('/') { slim :index }

%i{gaestebuch bilder links mitglieder vhg passiv}.each do |p|
  get("/#{p}") { slim p }
end
