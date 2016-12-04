//= require_tree ../../../vendor/assets/javascripts/inspinia/toastr/.

function initAlert() {
  // Toastr options
  toastr.options = {
    'closeButton': true,
    'debug': false,
    'progressBar': false,
    'preventDuplicates': true,
    'positionClass': 'toast-top-center',
    'onclick': null,
    'showDuration': '400',
    'hideDuration': '1000',
    'timeOut': '7000',
    'extendedTimeOut': '1000',
    'showEasing': 'swing',
    'hideEasing': 'linear',
    'showMethod': 'fadeIn',
    'hideMethod': 'fadeOut'
  };
}

function parseAlerts(json) {
  var messages = JSON.parse($('#js-alerts').attr('data-messages')) || {},
    toasterMap = {
      'alert': 'error',
      'notice': 'info'
    };

  if (json !== null && json !== undefined) {
    messages = json;
  }
  Object.getOwnPropertyNames(messages).forEach(function (key) {
    if (Object.keys(toasterMap).includes(key)) {
      var message = messages[key]; // eslint-disable-line

      if (Array.isArray(message)) {
        message.forEach(function (val) {
          toastr[toasterMap[key]](val);
        });
      } else {
        toastr[toasterMap[key]](message);
      }
    }
  });
}

function showAlert(message, key) { // eslint-disable-line
  var toasterMap = {
    'alert': 'error',
    'notice': 'info'
  };

  toastr[toasterMap[key]](message);
}

$(function () {
  initAlert();
  parseAlerts();
});
