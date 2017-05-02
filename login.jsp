<!DOCTYPE html>
<html>
  <head>
    <meta charset=""UTF-8”/>
    <title>Home Page</title>
 	
 	<!-- Vendor CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">

	<!-- Style CSS -->
	<link href="css/style.css" rel="stylesheet">

  </head>
  <body>
	<div id="login" class="text-center">
		<div id="login-fields">
			<h2><i class="fa fa-cloud" aria-hidden="true"></i> Cloud Platform</h3>
			<img src="images/tuoslogo_.gif" width="140" height="60" alt="TUOS">
			<div class="login-div">
				<form action="login" method="POST" class="login">
					<label class="control-label hidden">input error</label>
					<div class="form-group">
						<input type="email" name="email" class="form-control" id="email" placeholder="Email">
					</div>
					<div class="form-group">
						<input type="password" name="password" class="form-control" id="password" placeholder="Password">
					</div>
					<button type="submit" id="login_btn" class="btn btn-default">LOGIN</button>
				</form>
				<h4>- OR -</h4>
				<button id="signup" class="btn btn-default">SIGN UP</button>
			</div>
			<div class="form-group" id="signup_fields">
				<div class="sign-up">
					<form action="registration" method="POST" id="submit-form"> 
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<input type="text" name="fname" class="form-control" id="firstname" placeholder="First Name">
								</div>	
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input type="text" name="lname" class="form-control" id="lastname" placeholder="Last Name">
								</div>	
							</div>
						</div>
						<div class="form-group">
							<input type="email" name="email" class="form-control" id="email" placeholder="Sheffield Email Address">
						</div>
						<div class="form-group">
							<input type="text" name="phone" class="form-control" id="phone" placeholder="Phone Number">
						</div>
						<div class="form-group">
							<input type="password" name="password" class="form-control" id="password" placeholder="Password">
						</div>
						<button type="submit" class="btn btn-default">CREATE ACCOUNT</button> 
					</form>
				</div>
				<div class="form-group">
					<button id="login-back" class="btn btn-default">
						<i class="fa fa-arrow-left" aria-hidden="true"></i> BACK TO LOGIN
					</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/application.js"></script>

  </body>
</html>