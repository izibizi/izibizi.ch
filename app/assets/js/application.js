//= require bootstrap-sprockets
$(document).ready(function() {
  // replace images with retina-variant
  var pixelRatio = "(-webkit-min-device-pixel-ratio: 1.5),(min--moz-device-pixel-ratio: 1.5),(-o-min-device-pixel-ratio: 3/2),(min-resolution: 1.5dppx)";
  // check if we have a retina screen
  if (window.matchMedia && window.matchMedia(pixelRatio).matches) {
    $('img[data-retina]').each(function() {
      $(this).attr('src', $(this).data('retina'));
    });
  };

  // automatically open dropdowns on hover
  $('.dropdown').hover(function () {
    $(($(this)[0]).firstElementChild).dropdown('toggle');
  })
});
