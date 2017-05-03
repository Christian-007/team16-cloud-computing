$(function() {
	$("#signup").on('click', function() {
		$("#signup_fields").slideToggle(300);
		$("#login .login-div").slideToggle(300);
	});

	$("button#login-back").on('click', function() {
		$("#signup_fields").slideToggle(300);
		$("#login .login-div").slideToggle(300);
	});

	$("#user-lists button.topup").on('click', function() {
		var myCredit = $(this).data('amount');
		$("#topupModal p.currentCredit").text(myCredit);
	});
	
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
	        		alert("You can't put less than 1 Peanut!");
	        	}else {
	        		$btn.button('reset');
	        		alert("Error");
	        	}
	        }
	    });
	});	

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