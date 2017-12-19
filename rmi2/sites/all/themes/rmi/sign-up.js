
/**
 * JS for select box.
 */
$(document).ready(function(){
    $('#user_register_form #edit-name-wrapper').hide();
    $('#user_register_form #edit-mail').blur(function() {
        var value = $(this).val() ;
        $('#user_register_form #edit-name').val(value);
    });
    $('#empty_link').click(function() {
        return false;
    });
    pathArray = window.location.pathname.split( '/' );
    if(pathArray[2] == 'contact' && pathArray[3] == 'us' ) {
        $("ul.nice-menu li.menu-path-contact-us").addClass("active-trail");
    }
});