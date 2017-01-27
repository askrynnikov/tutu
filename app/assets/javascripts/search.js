/**
 * Created by andrey on 27.01.17.
 */
$(document).ready(function () {
    $('.new_search').submit(function () {
        var start_station;
        var end_station;

        start_station = $(this).find('#search_start_station_id');
        end_station = $(this).find('#search_end_station_id');

        console.log(end_station);

        if (start_station.val() === end_station.val()) {
            alert('Выберите станцию назначения');
            return false;
        } else {

        }
    });
});