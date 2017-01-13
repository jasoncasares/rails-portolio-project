//turn rails checkbox into javascript checkbox
function checkboxFor(task) {
  var checked = task.completed ? 'checked' : '';
  return "<input type='checkbox' value='" + task.id + "' " +
           checked + " />"
}

function displayTasks(response) {
  var $ol = $("div.tasks ol")
  $ol.html("") //emptied the ol
  // get a response(variable data)
  // with each task data, append an li to the ol with the task content
  response.forEach(function(task) {
    $ol.append("<li>" + task.description + ' ' + checkboxFor(task) + "</li>");
  })
  //Load data into the DOM
  // load that response into the HTML of the page.
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
      }
      //Load data into the DOM
      // load that response into the HTML of the page.
   })
   e.preventDefault();
   })
})


//Add new task via ajax/jquery post request
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
