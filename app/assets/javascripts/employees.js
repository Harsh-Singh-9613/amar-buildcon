$(document).on('change', '#site_id', function() {
  $.ajax({
    url: '/employees',
    type: "GET",
    dataType: 'script',
    data: {
      site_id: $(this).val()
    }
  })
});
