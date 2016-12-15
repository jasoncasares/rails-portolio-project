// $(function(){
//   $("a.load_tasks").on("click", function(e){
//     // // Fire some ajax.
//     // $.ajax({
//     //   method: "GET",
//     //   url: this.href,
//     // }).success(function (response) {
//     //   // get a response(variable data)
//     //   $("div.tasks").html(response)
//     //   //Load data into the DOM
//     // }).error(function(notNeeded) {
//     //   alert("Broke!!!!")
//     // });
//
//     //Request HTML
//     // $.get(this.href).success(function(response) {
//     //   $("div.tasks").html(response)
//     // })
//
//     // Requesting JSON
//     $.get(this.href).success(function(json) {
//       // clear the ol html
//        var $ol = $("div.tasks ol")
//        $ol.html("") //emptied the ol
//
//        // iterate over each task within json
//        json.forEach(function(task) {
//          // with each task data, append an li to the ol with the task content
//          $ol.append["<li>" + task.description + "</li>"];
//        })
//      })
//
//       // load that response into the HTML of the page.
//       e.preventDefault();
//   })
// })

$(function () {
  $("input.toggle").on("change", function () {
    $(this).parents("form").trigger("submit")
  })
})
