$(document).ready(function() {
    /* Toggling header menus */
    $("#welcome").click(function() {
        $("#welcome-menu").slideToggle("fast");
        $(this).toggleClass("activated-welcome");
        return false;
    });
    $('.panelTrigger').outside('click', function() {
        $('.panelContainer').stop(true, true).slideUp('fast');
    });
});