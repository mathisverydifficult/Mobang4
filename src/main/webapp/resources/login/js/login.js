/**
 * 
 */

$(function () {
	$(document).ready(function () {
		var token = $("meta[name='csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	});
	
});

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
	  if(profile.getId() != null){			
		  var email = profile.getEmail();
		  var name = profile.getName();
	      
		  location.href="/mobang/usersignupform.all?email="+email+"&name="+name;
	  }
}



	



