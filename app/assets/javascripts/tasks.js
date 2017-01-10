$(function(){
   $("a.load_tasks").on("click", function(e){
     console.log("in handler");
    // // Fire some ajax.
    $.ajax({
      method: "GET",
      url: this.href,
      dataType: "json",
      success: function (task) {
      // get a response(variable data)
      var $ol = $("div.tasks ol")
        $ol.html("") //emptied the ol
        // with each task data, append an li to the ol with the task content
        $ol.append("<li>" + task.description + task.completed + "</li>");
      }
      //Load data into the DOM
      // load that response into the HTML of the page.
   })
   return e.preventDefault();
   })
})

$(function() {
  $("#new_task").submit(function(e) {
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",
      cache: false,
      success: function(response) {
        $("#task_description").val("");
        var $ol = $("div.tasks ol")
        $ol.append("<li>" + response.description + "</li>");
      },
    });
    e.preventDefault();
  })
})
