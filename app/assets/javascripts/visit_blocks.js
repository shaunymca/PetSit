
jQuery(function() {
  var visit_type_ids, visit_type_name;
  $('#visit_block_client_name').autocomplete({
    source: $('#visit_block_client_name').data('autocomplete-source')
  });
  visit_type_ids = $("#visit_block_client_prices_id").html();
  visit_type_name = $("#visit_block_visit_type").html();
  $("#visit_block_client_name").keyup(function() {
    var client_name, options;
    client_name = visit_block_client_name.value;
    options = $(visit_type_ids).filter("optgroup[label=" + client_name + "]").html();
    if (options) {
      $("#visit_block_client_prices_id").html(options);
      return $("#visit_block_client_prices_id").trigger('change');
    } else {
      return $("#visit_block_client_prices_id").empty();
    }
  });
  $("#ui-id-1").click(function() {
    var client_name, options;
    client_name = visit_block_client_name.value;
    options = $(visit_type_ids).filter("optgroup[label=" + client_name + "]").html();
    if (options) {
      $("#visit_block_client_prices_id").html(options);
      return $("#visit_block_client_prices_id").trigger('change');
    } else {
      return $("#visit_block_client_prices_id").empty();
    }
  });
  return $("#visit_block_client_prices_id").change(function() {
    var data, selectedVisitid, visit, visit_hash, vsts;
    selectedVisitid = visit_block_client_prices_id.value;
    data = $('#client_prices_data').data('visit-source');
    visit_hash = $.parseJSON(data);
    vsts = $.grep(data, function(n, i) {
      return n.id == selectedVisitid;
    });
    console.log(vsts);
    if (vsts.length > 0) {
      $("#visit_block_visit_type").val(visit.visit_type);
      return $("#visit_block_visit_price").val(visit.price);
    }
  });
});
