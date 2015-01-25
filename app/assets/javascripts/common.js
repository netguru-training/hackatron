var ready = function () {
    console.log('test')
    $('.datetimepicker').datetimepicker({format:'Y-m-d H:i:s',mask: true});
}

$(document).ready(ready);
$(document).on('page:load', ready);
