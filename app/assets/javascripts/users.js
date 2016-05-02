// make sure this only operates on show page

// $(document).ready(function() { 
//   var id = $("#name").data('par')
//   $.get("/tags/" + id + ".json", function(data) {
//     $("#name").text(data.tag.name)
//     $("#count").text(data.tag.events.length)
//   })
// })

// on index page show first couple tags and then load rest with a button
// use kaminari? 

// $(document).ready(function() {
//   $.get("/tags.json", function(data) {
//     data.tags.forEach(function(arg) {
//       $("#tags").append("<p>Name: " + arg.name + "<p>");
//     })
//   })
// })

// event show page.  should probably do nested
// get event/:id/tags
// need to do my get request with the params included.  very similar to the show page

// $(document).ready(function() {
//   $.get("/tags.json", function(data) {
//     data.tags.forEach(function(arg) {
//       $("#tags").append("<p>Name: " + arg.name + "<p>");
//     })
//   })
// })

$(".tags.index").ready(function() {
  alert ("My example alert box.")
})
