//= require_tree ../../../vendor/assets/javascripts/inspinia/iCheck/.
//= require_tree ../../../vendor/assets/javascripts/inspinia/select2/.
//= require inspinia/touchspin/jquery.bootstrap-touchspin.min

function globalInit() {
  String.prototype.capitalize = function () {  // eslint-disable-line no-extend-native
    return this.charAt(0).toUpperCase() + this.slice(1);
  };

  $('li.js_active_menu.active').parents('li').addClass('active');

  $('.select2_demo_1').select2({ width: '100%' });
  $('body').on('hidden.bs.modal', '.js-remote-modal', function () {
    $(this).removeData('bs.modal');
  });
}

window.loadICheck = function () {
  $('.i-checks').iCheck({
    checkboxClass: 'icheckbox_square-green',
    radioClass: 'iradio_square-green'
  });
};

window.loadEditable = function (nameClass) {
  $('.' + nameClass).editable({
    ajaxOptions: { type: 'PUT', dataType: 'json' },
    placement: 'right',
    error: function (response) {
      return JSON.parse(response.responseText).alert.join(', ');
    }
  });
};

window.loadTouchSpin = function (nameClass, ChangeCallback) {
  $('.' + nameClass).TouchSpin({
    buttondown_class: 'btn btn-link',
    buttonup_class: 'btn btn-link'
  }).on('change', ChangeCallback);
};

function navHeaderClick() {
  $('.dropdown.profile-element').click(function() {
    $(this).toggleClass('open');
  })
}

$(function () {
  globalInit();
  navHeaderClick();
});
