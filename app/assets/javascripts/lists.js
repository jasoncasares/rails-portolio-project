// Submit Tasks via Ajax
$(function() {
  $("#new_task").on("submit", function(e) {
    //Need the URL to submit the POST request
    //Need the form data
    // Low Level
    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",
      method: "POST"
      .success(function(response) {
        $("task.description").val("");
        var $ol = $("div.tasks ol")
        $ol.append(response);
      })
    });
    e.preventDefault();
  })
})
