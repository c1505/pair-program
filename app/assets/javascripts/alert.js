// make sure this only operates on show page

$(".tags.show").ready(function() { 
  var id = $("#name").data('par')
  $.get("/tags/" + id + ".json", function(data) {
    $("#name").text(data.tag.name)
    $("#count").text(data.tag.events.length)
  })
})

// on index page show first couple tags and then load rest with a button
// use kaminari? 

$(".tags.index").ready(function() {
  $.get("/tags.json", function(data) {
    data.tags.forEach(function(arg) {
      $("#tags").append("<p>Name: " + arg.name + "<p>");
    })
  })
})

// event show page.  should probably do nested
// get event/:id/tags
// need to do my get request with the params included.  very similar to the show page

$(".exercisms.show").ready(function() {
  var id = $("#tags").data('par')
  $.get("/tags.json", {exercism_id: id}, function(data) {
    data.tags.forEach(function(arg) {
      $("#tags").append("<p>Name: " + arg.name + "<p>");
    })
  })
})

// $(".tags.show").ready(function() {
//   alert ("My example alert box.")
// })


