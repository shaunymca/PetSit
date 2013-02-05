$(function () {
  $('.edit_client input[type=checkbox]').click(function () {
    var thisCheckbox = $(this);
    var id = $(this).attr("id");
    var text = $("label[for=" + id + "]").text().toLowerCase();
    var name = $(this).attr("name").replace("[" + text + "]", "");
    $("input[name*='" + name + "']").each(function () {
        var thisInput = $(this);
        if (thisInput.attr("disabled")) {
            thisInput.removeAttr("disabled");
        } else {
            thisInput.attr("disabled", "disabled");
            thisCheckbox.removeAttr("disabled");
        }
    })
  });  
});