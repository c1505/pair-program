// make sure this only operates on show page

$(document).ready(function() { 
  // $("#name").text("this")

  // alert(par)
  // alert( $("#name").data('par') )
  var id = $("#name").data('par')

  $.get("/tags/" + id + ".json", function(data) {
    // debugger;
    $("#name").text(data.tag.name)
    // var email = data.user.email
    // var availability = data.user.availability
    // var slack = data.user.slack
    // debugger;
  })
})