$(function(){
   $("a.load_lists").on("click", function(e){
    // // Fire some ajax.
    //console.log(this.href)

    $.ajax({
      method: "GET",
      url: this.href,
      dataType: "json",
      success: function (resp) {
        var $ol = $("div.lists ol")
        $ol.html("") //emptied the ol
        resp.forEach(function(list) {
        $ol.append("<li>" + list.name + "</li>");
        })
      }
      //Load data into the DOM
      // load that response into the HTML of the page.
   })
   e.preventDefault();
   })
})
