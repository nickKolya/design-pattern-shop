var SignUpForm = {
  init: function () {
    this.hiddenInputs = 'input:hidden, select:hidden';
    this.$form = $('#new_user');
    this.$submitButton = $('input[type="submit"]');
    this.disableWith = this.$submitButton.data('disable-with');
    this.initForm();
    this.customizeSubmit();
    this.submitEvent();
  },
  initForm: function () {
    return this.$form.validate({
      ignore: SignUpForm.hiddenInputs,
      rules: {
        'user[first_name]': {
          required: true,
          minlength: 3
        },
        'user[email]': {
          required: true,
          email: true
        },
        'user[last_name]': {
          required: true,
          minlength: 3
        },
        'user[password]': {
          required: true,
          minlength: 8
        },
        'user[password_confirmation]': {
          required: true,
          minlength: 8
        },
        'user[phone_number]': {
          required: true,
          minlength: 11,
          maxlength: 13
        },
        privacy_agree: {
          required: true
        }
      },
      errorPlacement: function (error, element) {
        element.closest('.form-group').append(error);
      }
    });
  },
  submitEvent: function () {
    this.$form.on('submit', function (event) {
      if (SignUpForm.$form.valid() && $('#signup-second-step').hasClass('nonvisible')) {
        event.preventDefault();
        SignUpForm.showHiddenFields();
      }
    });
  },
  showHiddenFields: function () {
    var text = this.$submitButton.data('signup-text');

    $('#signup-second-step').slideDown();
    $('#signup-second-step').removeClass('nonvisible');
    CountrySelect.init();
    this.$submitButton.val(text);
  },
  customizeSubmit: function () {
    $('input[type="submit"]').removeAttr('data-disable-with');
  }
};
