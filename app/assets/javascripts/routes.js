$(document).ready(function () {
    $('a.edit_route').click(function (e) {
        e.preventDefault();

        var route_id;
        var form;
        var title;

        route_id = $(this).data('routeId');
        // console.log(route_id);
        form = $('#edit_route_' + route_id);
        title = $('#route_title_' + route_id);

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