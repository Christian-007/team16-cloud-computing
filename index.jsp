	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<div id="home" class="container">
		<div class="text-center">
			<h2>REGISTRATION</h2>
			<hr class="hor-line">
			<p>
				This is a registration form to create a user account for accessing the platform.
			</p>
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
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>