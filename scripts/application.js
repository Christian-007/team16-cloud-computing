$(function() {
	$("#signup").on('click', function() {
		$("#signup_fields").slideToggle(300);
		$("#login .login-div").slideToggle(300);
	})

	$("button#login-back").on('click', function() {
		$("#signup_fields").slideToggle(300);
		$("#login .login-div").slideToggle(300);
	})
});