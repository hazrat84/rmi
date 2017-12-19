
/**
 * JS for select box.
 */
$(document).ready(function(){
//  var clearMePrevious = '';
//
//  // clear input on focus
//  $('.form-text').focus(function()
//  {
//    clearMePrevious = $(this).val();
//    $(this).val('');
//  });
//
//  // if field is empty afterward, add text again
//  $('.form-text').blur(function()
//  {
//    if($(this).val()=='')
//    {
//      $(this).val(clearMePrevious);
//    }
//  });

bind_select_design();
 
  $('.form-select').bind("change", function() {
    showvalue($(this).val())
  });

  $().ajaxStop(function(){
    bind_select_design();
  });

});

function bind_select_design(){
  try {
    var dd3 = $('.form-select').msDropDown({
      mainCSS:'dd2',
      onInit:showvalue
    }).data("dd");
    var opt = dd3.get('length');
    //dd3 = dd3.add({text:"lucky", value:"luckyval", title:'images/icon-ok.gif'}, opt);
    $("#open3").click(function() {
      dd3.open();
    });
    $("#close3").click(function() {
      dd3.close();
    });
    //dd3.addMyEvent("onOpen", showvalue);
    //dd3.addMyEvent("onClose", showvalue);
    dd3.addMyEvent("onclick", showvalue);
    //dd3.disabled(true);
    //items  = document.getElementById("ComOS2").item(1);
    items  = dd3.item(1);

    var ver = dd3.get('version');
    $("#ver").html(ver);

  //alert(items)
  } catch(e) {
//    alert("Error: a"+e.message);
  }
}

 function showvalue(arg) {
  //alert(arg);
  //arg.visible(false);
  }


