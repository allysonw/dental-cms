$(function() {
  bindClickHandlers();
});

function bindClickHandlers() {
  $("a.patient-index-link").on("click", function(e) {
    e.preventDefault();
    console.log('clicked')
    $.ajax({
        method: "GET",
        url: "/patients",
        dataType: "json"
    })
    .done(function(response) {
      console.log(response)
    })
    .error(function() {});
  });
}
