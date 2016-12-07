var Item = {
  _sendDataAjax: function (action, method, data, successCallback) {
    $.ajax({
      type: method || 'post',
      url: action,
      data: data,
      dataType: 'text',
      error: Item._errorCallback,
      success: successCallback
    });
  },

  submitForm: function (event) {
    event.preventDefault();

    Item._sendDataAjax(this.action, $(this).find('[name=_method]').val(),
      $(this).serialize(), Item._sumbitFormSucessCallback);
  },

  _sumbitFormSucessCallback: function (result) {
    parseAlerts(JSON.parse(result));
    $('.submit-form-js').prop('disabled', false);
  },

  _errorCallback: function (result) {
    var alerts = JSON.parse(result.responseText);

    parseAlerts(alerts);
    $('.submit-form-js').prop('disabled', false);
  }
};

var renderImage = function () {
  var imageInput = $('.img-uploads-selector-js'),
    chosenImageFile = imageInput[0].files[0],
    src = window.URL.createObjectURL(chosenImageFile);

  $('.img-uploads-container').css('background-image', 'url(' + src + ')');
};


$(function() {
  $('.img-uploads-selector-js').on('change', renderImage);
})
