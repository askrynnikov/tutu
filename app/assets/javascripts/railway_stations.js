$(document).ready(function () {
    // если используется turbolinks
    // $(document).on('turbolinks:load', function() {
    $('a.edit_station').click(function (e) {
        e.preventDefault();

        var station_id;
        var form;
        var title;

        station_id = $(this).data('railwayStationId');
        console.log(station_id);
        form = $('#edit_railway_station_' + station_id);
        title = $('#railway_station_title_' + station_id);

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
