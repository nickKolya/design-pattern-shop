// ACTION: index
//= require inspinia/iCheck/icheck.min
//= require inspinia/validate/jquery.validate.min
//= require users/registrations/sign_up_form

$(function () {
  window.loadICheck();

  SignUpForm.init();
});
