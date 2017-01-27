$(document).ready(function () {
    $('a.edit_train').click(function (e) {
        e.preventDefault();

        var train_id;
        var form;
        var title;

        train_id = $(this).data('trainId');
        // console.log(train_id);
        form = $('#edit_train_' + train_id);
        title = $('#train_title_' + train_id);

        form.toggle();
        title.toggle();

        if (!$(this).hasClass('cancel')) {
            $(this).html("Отмена");
            $(this).addClass('cancel');
        } else {
            $(this).html("Изменить");
            $(this).removeClass('cancel');
        }
    });
});