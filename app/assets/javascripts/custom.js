//general
// page specific javascript included
// object
function TagEvents (tag) {
  this.name = tag.name;
  this.id = tag.id;
  this.events = tag.events;
  this.count = function() {
    return this.events.length;
  };
  this.toUrl = function() {
    return ("<a href='/tags/" +  this.id + "'>" + this.name + "</a></br>");
  };
}

//formatter
function Tag (tag) {
  this.name = tag.name;
  this.id = tag.id;
  this.toUrl = function() {
    return ("<a href='/tags/" +  this.id + "'>" + this.name + "</a></br>");
  };
}

$(".tags.show").ready(function() {
  var defaultUrl = "/tags/" + $("#name").data('par');

  getEvents(defaultUrl);
  $("#tags a").on('click', function(event){
    event.preventDefault();
    clickedUrl = $(this).attr('href');
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
  $('#event').text("");
  data.tag.events.forEach(function(event) {
    $('#event').append(
    "<div class='col-xs-6 col-lg-4'>" +
      "<h2>" + event.category + "</h2>" +
      "<h3>" + event.title + "</h3>" +
      "<p><a href='/exercisms/" +  event.id + "'>More Information</a>" + "</p>" +
    "</div>"
      );
  });
}

function addTag(data) {
  var t1 = new TagEvents(data.tag);
  $("#name").text(t1.name);
  $("#count").text( t1.count() );
}

$(".tags.index").ready(function() {
  $.get("/tags.json", function(data) {
    data.tags.forEach(function(item) {
      var tag = new Tag(item);
      $("#tags").append(tag.toUrl());
    });
  });
});

// event show page
$(".exercisms.show").ready(function() {
  var id = $("#tags").data('par');
  $.get("/tags.json", {exercism_id: id}, function(data) {
    data.tags.forEach(function(tag) {
    var tagObject = new Tag(tag);
      $("#tags").append(tagObject.toUrl());
    });
  });
  submitTag();
});


function submitTag() {
  $('form').submit(function(event) {
    event.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/tags', values);
    posting.success(function(data) {
      var tag = new Tag(data.tag);
      $("#tags").append(tag.toUrl());
      $("#tag_name").val("");
    });
  });
}
