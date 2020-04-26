$(document).on('click', 'input[type=checkbox]', function(e) {
    $(e.target).parent('label').toggleClass('checked');
});
