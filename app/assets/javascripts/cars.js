$(document).ready(function () {
    plases_set_visible()
    // если используется turbolinks
    // $(document).on('turbolinks:load', function() {
    $('.type-car').change(function (e) {
        e.preventDefault();
        plases_set_visible();
        // alert($(".type-car select").val());
    });
});

function plases_set_visible() {
    switch ($(".type-car select").val()) {
        case 'CompartmentCar':
            $('.lower_places').removeClass('hidden');
            $('.top_places').removeClass('hidden');
            $('.lower_side_places').addClass('hidden');
            $('.top_side_places').addClass('hidden');
            $('.seat_places').addClass('hidden');
            break;
        case 'SeatCar':
            $('.lower_places').addClass('hidden');
            $('.top_places').addClass('hidden');
            $('.lower_side_places').addClass('hidden');
            $('.top_side_places').addClass('hidden');
            $('.seat_places').removeClass('hidden');
            break;
        case 'EconomyCar':
            $('.lower_places').removeClass('hidden');
            $('.top_places').removeClass('hidden');
            $('.lower_side_places').removeClass('hidden');
            $('.top_side_places').removeClass('hidden');
            $('.seat_places').addClass('hidden');
            break;
        case 'SleepingCar':
            $('.lower_places').removeClass('hidden');
            $('.top_places').addClass('hidden');
            $('.lower_side_places').addClass('hidden');
            $('.top_side_places').addClass('hidden');
            $('.seat_places').addClass('hidden');
            break;
        default:
            $('.lower_places').addClass('hidden');
            $('.top_places').addClass('hidden');
            $('.lower_side_places').addClass('hidden');
            $('.top_side_places').addClass('hidden');
            $('.seat_places').addClass('hidden');
    }
}
