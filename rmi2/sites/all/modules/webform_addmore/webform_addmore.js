$(document).ready(function() {
   $("#edit-submit").live('click',function(event) {
       if( $("#edit-recommendation-letter-title").val() == '' ) {
            alert("Please Enter Title");
            return false;
        }
        if( $("#edit-person").val() == '' ) {
            alert("Please Enter the Person Name");
            return false;
        }
        if( $("#edit-letter-file").val() != '' ) {
            var file_arr =$("#edit-letter-file").val().split('.');
            var extension = ['doc', 'docx', 'pdf', 'gif', 'jpg', 'png'];
            if ( (jQuery.inArray(file_arr[1], extension )) == -1 ) {
                alert("File format not supported. ");
                return false;
            }
        }
    });

    $("#edit-message-wrapper div").removeClass("resizable-textarea");
    $(".pop-up-links").live('click',function(event) {
        $('#cboxClose').click();
    });
});

function removeSubDataGroup(clickedBtn, ssid) {
    var url = Drupal.settings.basePath + "webform_addmore/js/remove/subdatagroup/" + ssid;
    var element = $(clickedBtn);
    $.ajax({url:url, success:function(result){
        var quantity = element.parent("fieldset").parent("fieldset").find("input:hidden").val();
        element.parent("fieldset").parent("fieldset").find("input:hidden").val(quantity-1);
        element.parent("fieldset").remove();
        window.location.reload( true );
    }});
    return false;
}
