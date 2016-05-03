

$(".tags.show").ready(function() { 
  var id = $("#name").data('par')
  $.get("/tags/" + id + ".json", function(data) {
    $("#name").text(data.tag.name)
    $("#count").text(data.tag.events.length)
    data.tag.events.forEach(function(arg) {
      $('#event').append(
      "<div class='col-xs-6 col-lg-4'>" +
        "<h2>" + arg.category + "</h2>" +
        "<h3>" + arg.title + "</h3>" +
      "</div>"
        );
    });
  });
})
// render a partial of all the tags in a tag cloud.  change the link.  wrap the above function and call
// it each time a button is clicked

// for each event, add to the dom

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
        $("#tags").append("<p>Name: " + data.tag.name + "<p>")
        $("#tag_name").val("")
      });
    });
}
