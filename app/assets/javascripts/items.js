var renderImage = function () {
  var imageInput = $('.img-uploads-selector-js'),
    chosenImageFile = imageInput[0].files[0],
    src = window.URL.createObjectURL(chosenImageFile);

  $('.img-uploads-container').css('background-image', 'url(' + src + ')');
};

$(function() {
  $('.img-uploads-selector-js').on('change', renderImage);
})
