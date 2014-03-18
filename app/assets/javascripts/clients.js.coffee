jQuery ->
  $(".edit_client input[type=checkbox]").click ->
    thisCheckbox = $(this)
    id = $(this).attr("id")
    text = $("label[for=" + id + "]").text().toLowerCase()
    name = $(this).attr("name").replace("[" + text + "]", "")
    $("input[name*='" + name + "']").each ->
      thisInput = $(this)
      if thisInput.attr("disabled") and thisInput.attr("type") is "text"
        thisInput.removeAttr "disabled"
      else if thisInput.attr("type") is "text"
        thisInput.attr "disabled", "disabled"
        thisCheckbox.removeAttr "disabled"
      else

      return

    return

		$("#birth_date").datepicker(format: "mm/dd/yyyy").on "changeDate", (ev) ->
			$("#birth_date").datepicker "hide"
