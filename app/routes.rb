get('/') { slim :index }

%i{gaestebuch bilder links vhg passiv}.each do |p|
  get("/#{p}") { slim p }
end
