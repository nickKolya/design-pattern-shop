//= require inspinia/sweetalert/sweetalert.min.js

$(function() {
  $('.swal').click(function () {
    var thisSwal = $(this);
    var index = $(this).data('index');
    var text = $(this).data('text');
    var title = $(this).data('title');
    var button = $(this).data('button');
    var color = $(this).data('color');
    if(text === undefined){
      text = 'You will not be able to recover this record!';
    }
    if(title === undefined){
      title = 'Are you sure?';
    }
    if(button === undefined){
      button = 'Yes, delete it!';
    }
    if(color === 'green'){
      color = '#19A882';
    }else{
      color = '#DD6B55';
    }
    swal({
      title: title,
      text: text,
      type: 'info',
      showCancelButton: true,
      confirmButtonColor: color,
      confirmButtonText: button,
      closeOnConfirm: false
    }, function (isConfirm) {
      if (isConfirm) {
        var find = $(thisSwal).find('.swal-form-js[data-index=' + index + ']');
        var siblings = $(thisSwal).siblings('.swal-form-js[data-index=' + index + ']');
        var submit;
        submit = find.length ? find : siblings;
        submit.submit();
      }
    });
  });
});
