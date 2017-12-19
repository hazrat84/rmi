$(document).ready(function() {
    $(".content ul.menu li").each(function(index) {
        if($(this).text() == 'Contacts') {
            $(this).find('a').addClass("active");
        }
    });
});