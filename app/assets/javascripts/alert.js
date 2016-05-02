// tag show page

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

// event show page
$(".exercisms.show").ready(function() {
  var id = $("#tags").data('par')
  $.get("/tags.json", {exercism_id: id}, function(data) {
    data.tags.forEach(function(arg) {
      $("#tags").append("<p>Name: " + arg.name + "<p>");
    })
  })

  submitTag()

})

function submitTag() {
  $('form').submit(function(event) {
      //prevent form from submitting the default way
      event.preventDefault();
      var values = $(this).serialize();
 
      var posting = $.post('/tags', values);
 
      posting.done(function(data) {
        // TODO: handle response
        $("#tags").append("<p>Name: " + data.tag.name + "<p>")
        $("#tag_name").val("")
      });
    });
}

// $.ajax({
//   method: "POST"
//   url: "/tags"
//   data: {exercism_id: id, name: name}
// })

// $.ajax({
//   method: "POST",
//   url: "/tags",
//   data: {exercism_id: 2, name: "nananannana"}
// })

// $(function () {
//     $('form').submit(function(event) {
//       //prevent form from submitting the default way
//       event.preventDefault();
 
//       var values = $(this).serialize();
 
//       var posting = $.post('/posts', values);
 
//       posting.done(function(data) {
//         // TODO: handle response
//       });
//     });
//   });