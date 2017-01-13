function checkboxFor(task) {
  var checked = task.completed ? 'checked' : '';
  return "<input type='checkbox' value='" + task.id + "' " +
           checked + " />"
}

function displayTasks(response) {
  var $ol = $("div.tasks ol")
  $ol.html("") //emptied the ol
  response.forEach(function(task) {
    $ol.append("<li>" + task.description + ' ' + checkboxFor(task) + "</li>");
  })
}
$(function(){


   $("a.load_tasks").on("click", function(e){
    // // Fire some ajax.
    $.ajax({
      method: "GET",
      url: this.href,
      dataType: "json",
      success: function (response) {
        displayTasks(response)
      // get a response(variable data)


        // with each task data, append an li to the ol with the task content

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
        displayTasks(response)
      },
    });
    e.preventDefault();
  })
})
