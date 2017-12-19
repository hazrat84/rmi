$(document).ready(function() {
  $(".defaultText").focus(function() {
    if ($(this).val() === $(this)[0].title) {
      $(this).removeClass("defaultTextActive");
      $(this).val("");
    }
  });

  $(".defaultText").blur(function()
  {
    if ($(this).val() === "") {
      $(this).addClass("defaultTextActive");
      $(this).val($(this)[0].title);
    }
  });

  $(".defaultText").blur();

  // ask for confirmation when unsharing the data group
  $('.delete_entry').click(function() {
    var answer = confirm('Are you sure you want to Unshare the Shared Data Group?');
    return answer;
  });
});

function setPass() {
  document.getElementById('edit-placeholder').style.display = 'none';
  document.getElementById('edit-pass').style.display = 'inline';
  document.getElementById('edit-pass').focus();
}
function checkPass() {
  if (document.getElementById('edit-pass').value.length === 0) {
    document.getElementById('edit-placeholder').style.display = 'inline';
    document.getElementById('edit-pass').style.display = 'none';
  }
}
