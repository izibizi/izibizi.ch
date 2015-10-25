if ($('#fb-gallery').length > 0) {
  var api_host = 'graph.facebook.com',
      base_url = 'gmizibizi/albums?fields=id,name,cover_photo,type&limit=999',
      album_params = 'photos?fields=id,images,album&limit=999';

  var root = $('#fb-gallery');

  function api(path) { return 'https://'+api_host+'/'+path; }
  function album_api(album_id) {
    return api(album_id+'/'+album_params);
  }

  // takes the response from an Graph-API request for multiple albums, builds the
  // gallery frrm it and replaces the HTML of the Root-Element (div#fb-root) with
  // the built gallery
  function buildGallery (data) {
      var albums = [];

      for (var i = 0; i < data.length; i++) {
        var album = data[i];
        // skip the album if it is of type "wall", "cover" or "mobile"
        if (['wall', 'cover', 'mobile', 'profile'].indexOf(album.type) != -1) {
          continue;
        }

        albums.push(buildAlbumThumb(album));
      }
      root.html(
        '<ul class="gallery small-block-grid-2 medium-block-grid-4 large-block-grid-5">'+
        albums.join('')+
        '</ul>'
      )
      $(document).foundation();
      var links = root.find('a');
      for (var i = 0; i < links.length; i++) {
        links[i].onclick = function() { setTimeout(run, 10) };
      };
  }

  // takes the data for one album and builds a thumbnail for it
  function buildAlbumThumb (album) {
    return '<li>'+
        '<a class="th radius" href="#album/'+album.id+'">'+
          '<img src="https://'+api_host+'/'+album.cover_photo+'/picture?type=album">'+
        '</a>'+
        '<h5>'+album.name+'</h5>'+
      '</li>';
  }

  // takes the response from a Graph-API Request for an album (or multiple
  // images?), builds a gallery from it and replaces the HTML of the Root-Element
  // (div#fb-root) with the built gallery
  function buildAlbum (data) {
    var images = [];

    for (var i = 0; i < data.length; i++) {
      images.push(buildImageThumb(data[i]));
    };
    root.html(
      '<p><a href="/bilder">&lt; Zurück zu den Alben</a></p>'+
      '<h2>'+data[0].album.name+' <small>'+
        '<a href="https://www.facebook.com/media/set/?set=a.'+data[0].album.id+'">'+
        'Album auf Facebook anschauen</a></small></h2>'+
      '<ul class="album clearing-thumb" data-clearing>'+
        images.join('')+
      '</ul>'
    );
    // IMPORTANT activate Foundation Events etc.
    $(document).foundation();
  }

  // takes the data for one image, determines its biggest variant, and builds a
  // thumbnail for it.
  function buildImageThumb (image) {
    // determine which variant is the biggest one!
    var biggest_image = image.images[0];
    for (var i = 1; i < image.images.length; i++) {
      if (image.images[i].width > biggest_image.width) {
        biggest_image = image.images[i];
      };
    };

    return '<li>'+
        '<a class="th" href="'+biggest_image.source+'">'+
          '<img src="https://'+api_host+'/'+image.id+'/picture?type=album">'+
      '</a></li>';
  }

  function loadGallery () {
   $.get(api(base_url), function( response ) {
      buildGallery(response.data);
    });
  }

  function loadAlbum (album_id) {
    $.get(album_api(album_id), function( response ) {
      buildAlbum(response.data);
    });
  }

  // on startup, load the gallery.
  function run() {
    var route = window.location.hash.substr(1).split('/');
    if (route.length > 1) {
      // #album/1234
      if (route[0] == 'album') {loadAlbum(route[1])};
    } else {
      loadGallery();
    }
  }

  run();
}
