$(function() {

	// signup button
	$("#signup").on('click', function() {
		$("#signup_fields").slideToggle(300);
		$("#login .login-div").slideToggle(300);
	});

	// back to login button
	$("button#login-back").on('click', function() {
		$("#signup_fields").slideToggle(300);
		$("#login .login-div").slideToggle(300);
	});

	// topup peanut
	$("#user-lists button.topup").on('click', function() {
		var myCredit = $(this).data('amount');
		$("#topupModal p.currentCredit").text(myCredit);
	});

	// edit personal details
	$("#user-lists .edit-personal").on('click', function() {
		var email = $("#user-lists p.user-email").text();
		var fname = $("#user-lists p.fullName").data('fname');
		var lname = $("#user-lists p.fullName").data('lname');
		var phone = $("#user-lists p.user-phone").text();

		$("#editDetailsModal #email").val(email);
		$("#editDetailsModal #fname").val(fname);
		$("#editDetailsModal #lname").val(lname);
		$("#editDetailsModal #phone").val(phone);
	});

	// Form submission for Changing Passowrd
	$("#uploadModal button#upload_btn").on('click', function(e) {
		e.preventDefault();
		var imgExtension = ['gif', 'png', 'jpeg', 'jpg'];
		var app_name = $("#uploadModal input#app_name").val();
		var description = $("#uploadModal textarea#description").val();
		var upload = $("#uploadModal input#upload").val().split('.').pop().toLowerCase();
		var icon = $("#uploadModal input#icon").val().split('.').pop().toLowerCase();
		var isImg = false; var isJar = false; var isEmpty = false;

		if(app_name !== "" && upload !== "" && description !== "" && icon !== ""){
			if(upload === 'jar'){
				isJar = true;
			}
			for(var i=0; i<imgExtension.length; i++){
				if(icon === imgExtension[i]){
					isImg = true;
				}
			}
		}else {
			alert("Please fill up all of the fields.");
			isEmpty = true;
		}

		if(isJar && isImg){
			var $btn = $(this).button('loading');
			$('#uploadModal form#uploadForm').submit();	
			alert("Successfully upload your app!");
			isJar = false; isImg = false; isEmpty = false;
		}else if(!isEmpty){
			if(!isJar) alert("Please upload .jar file.");
			if(!isImg) alert("Please upload gif, png, jpeg, or jpg app icon file.");
		}
		
	});	

	// variable to store link for app
	var linkToApp;

	// Form submission for Changing Passowrd
	$("#passwordModal button#password_btn").on('click', function(e) {
		e.preventDefault();

		var oldPassword = $("#passwordModal #oldPassword").val();
		var newPassword = $("#passwordModal #newPassword").val();
		var $btn = $(this).button('loading');

		$.ajax({
	        url: "changePassword",
	        type:"POST", 
	        data:{
	        	oldPassword: oldPassword,
	        	newPassword: newPassword
	        },
	        success: function(data){
	        	if(data == "true"){
	        		alert("Successfully changed your password!")
	        		window.location = 'users.jsp';
	        	}else if(data == "false") {
	        		$btn.button('reset');
	        		alert("Your old password does not match!");
	        	}else if(data == "empty") {
	        		$btn.button('reset');
	        		alert("You can't submit empty password");
	        	}else {
	        		$btn.button('reset');
	        		alert("Submission Error");
	        	}
	        }
	    });
	});	

	// Form submission for Edit Personal Details
	$("#editDetailsModal button#editUser_btn").on('click', function(e) {
		e.preventDefault();
		var $btn = $(this).button('loading');

		$.ajax({
	        url: "editDetails",
	        type:"POST", 
	        data:{
	        	email: $("#editDetailsModal #email").val(),
	        	fname: $("#editDetailsModal #fname").val(),
	        	lname: $("#editDetailsModal #lname").val(),
	        	phone: $("#editDetailsModal #phone").val()
	        },
	        success: function(data){
	        	if(data == "true"){
	        		window.location = 'users.jsp';
	        	}else if(data == "false") {
	        		$btn.button('reset');
	        		alert("There is something wrong with input fields.");
	        	}else {
	        		$btn.button('reset');
	        		alert("Submission Error");
	        	}
	        }
	    });
	});	

	var selectedAppIDDelete;
	$("a.delete-app").on('click', function(e) {
		selectedAppIDDelete = $(this).data('appuserid');
		console.log(selectedAppIDDelete);
	});

	// Form submission for Deleting Applications
	$("#deleteAppModal button#deleteapp_btn").on('click', function(e) {
		e.preventDefault();
		var $btn = $(this).button('loading');

		$.ajax({
	        url: "deleteApp",
	        type:"POST", 
	        data:{
	        	appUserID: selectedAppIDDelete
	        },
	        success: function(data){
	        	// alert(data);
	        	if(data == "true"){
	        		alert("Successfully delete your application.");
	        		window.location = 'index.jsp';
	        	}else if(data == "false") {
	        		$btn.button('reset');
	        		alert("Something wrong :(");
	        	}else if(data == "exception") {
	        		$btn.button('reset');
	        		alert("Exception occurred.");
	        	}
	        	else {
	        		$btn.button('reset');
	        		alert("Error");
	        	}
	        }
	    });
	});	

	var selectedAppID;
	$("a.open-app").on('click', function(e) {
		linkToApp = $(this).data('link');
		selectedAppID = $(this).data('appuserid');
		console.log(linkToApp);
	});
	
	// Form submission for Opening Applications
	$("#openAppModal button#openapp_btn").on('click', function(e) {
		e.preventDefault();
		var $btn = $(this).button('loading');

		$.ajax({
	        url: "pay",
	        type:"POST", 
	        data:{
	        	appUserID: selectedAppID
	        },
	        success: function(data){
	        	// alert(data);
	        	if(data == "true"){
	        		window.open(linkToApp);
	        		window.location = 'index.jsp';
	        	}else if(data == "false") {
	        		$btn.button('reset');
	        		alert("Your peanut is less than 100! Please topup your 'peanut' first ;)");
	        	}else if(data == "exception") {
	        		$btn.button('reset');
	        		alert("Exception occurred.");
	        	}
	        	else {
	        		$btn.button('reset');
	        		alert("Error");
	        	}
	        }
	    });
	});	
	
	// Form submission for Topping Up
	$("#topupModal button#topup_btn").on('click', function(e) {
		e.preventDefault();
		var $btn = $(this).button('loading');
		$.ajax({
	        url: "topup",
	        type:"POST", 
	        data:{
	        	topupAmount: $("#topupModal input#topupAmount").val()
	        },
	        success: function(data){
	        	if(data == "true"){
	        		window.location = 'users.jsp';
	        	}else if(data == "false") {
	        		$btn.button('reset');
	        		alert("You can't put less than 1 Peanut! Please topup your 'peanut' appropriately ;)");
	        	}else {
	        		$btn.button('reset');
	        		alert("Error");
	        	}
	        }
	    });
	});	

	// Form submission for Logging In
	$("button#login_btn").on('click', function(e) {
		e.preventDefault();
		if(!$("form.login label.control-label").hasClass("hidden")){
			$("form.login label.control-label").addClass("hidden");
		}
		var $btn = $(this).button('loading');
		$.ajax({
	        url: "login",
	        type:"POST", 
	        data:{
	        	email: $("form.login input#email").val(), 
	        	password: $("form.login input#password").val()
	        },
	        success: function(data){
	        	// alert("data: " + data);
	        	if(data == "true"){
	        		window.location = 'index.jsp';
	        	}else if(data == "false") {
	        		$btn.button('reset');
	        		$("form.login label.control-label").removeClass("hidden");
	        		$("form.login label.control-label").text("*WRONG USERNAME OR PASSWORD");
	        	}else {
	        		alert("Error");
	        	}
	        }
	    });
	});
});