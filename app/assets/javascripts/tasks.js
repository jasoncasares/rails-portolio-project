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

//Attempt to change rails checkbox to javascript
// $(function() {
//     $("#task_completed").click(function() {
//         $(this).find('input:checkbox').prop("checked", true);
//     });
// });

$("#task_completed").bind('change', function(){
  if (this.checked){
    var bool = this.checked ? 1 : 0;
    $.ajax({
      url: this.action,
      type: 'POST',
      data: this.value
    });
  }
  else {
    alert("no");
  }
});

//Add new task via ajax/jquery
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
        $ol.append("<li>" + response.description + " | " + response.completed + "</li>");
      },
    });
    e.preventDefault();
  })
})
