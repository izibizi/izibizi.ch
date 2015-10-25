//= require bootstrap-sprockets

$(document).ready(function() {
  $.ajaxSetup({ cache: true });
  $.getScript('//connect.facebook.net/de_CH/sdk.js', function () {
    FB.init({
      appId   : '948928015195601',
      xfbml   : false,
      version : 'v2.5'
    });

    FB.api('gmizibizi/albums', 'get', { fields: ['id', 'name', 'cover_photo', 'type'], limit: 999 }, function (message) {
      console.log(message);
    });
  });
});
