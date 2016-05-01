// make sure this only operates on show page

$(document).ready(function() { 
  // alert("this");
  $.get("/users/1.json", function(data) {
    // debugger;
    var email = data.user.email
    var availability = data.user.availability
    var slack = data.user.slack
    
  })
})