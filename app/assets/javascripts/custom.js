//general
// page specific javascript included
// object
function Tag (name, events) {
  this.name = name;
  this.events = events;
  this.count = function() {
    return events.length;
  };
}

$(".tags.show").ready(function() {
  var defaultUrl = "/tags/" + $("#name").data('par');

  getEvents(defaultUrl);

  $("#tags a").on('click', function(event){
    event.preventDefault();
    clickedUrl = $(this).attr('href');
    $('#event').text("");
    getEvents(clickedUrl);
  });
});

function getEvents(url) {
  $.get(url + ".json", function(data) {
    addTag(data);
    addEvents(data);
  });
}

function addEvents(data) {
  data.tag.events.forEach(function(arg) {
    $('#event').append(
    "<div class='col-xs-6 col-lg-4'>" +
      "<h2>" + arg.category + "</h2>" +
      "<h3>" + arg.title + "</h3>" +
      "<p><a href='/exercisms/" +  arg.id + "'>More Information</a>" + "</p>" +
    "</div>"
      );
  });
}

function addTag(data) {
  var t1 = new Tag(data.tag.name, data.tag.events);
  $("#name").text(t1.name);
  $("#count").text( t1.count() );
}

$(".tags.index").ready(function() {
  $.get("/tags.json", function(data) {
    data.tags.forEach(function(arg) {
      $("#tags").append("<p>Name: " + arg.name + "<p>");
    });
  });
});

// event show page
$(".exercisms.show").ready(function() {
  var id = $("#tags").data('par');//getting the event id from the show page.
  $.get("/tags.json", {exercism_id: id}, function(data) {
    data.tags.forEach(function(arg) {
      $("#tags").append("<p>" + arg.name + "<p>");
    });
  });
  submitTag();
});

//submits a post request of the tag and adds the tag to the dom without a page refresh.
function submitTag() {
  $('form').submit(function(event) {
    event.preventDefault();
    var values = $(this).serialize(); //encodes form elements as a string for submission
    var posting = $.post('/tags', values);
    posting.success(function(data) {
      $("#tags").append("<p>" + data.tag.name + "<p>");
      $("#tag_name").val("");//resets field to blank upon submission
    });
  });
}
