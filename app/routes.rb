get('/') { slim :index }

%i{gaestebuch bilder links vhg}.each do |p|
  get("/#{p}") { slim p }
end
