var ready = function () {
    console.log('test')
    $('.datetimepicker').datetimepicker({mask: true, inline: true});
}


$(document).ready(ready);
$(document).on('page:load', ready);
