<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<style>
		#msg{
			color:green;			
		}
	</style>
	<%@include file="Bootstrap/Bootstrap.jsp"%>
</head>

<body class="container-fluid">
	
	<h2>Add Products</h2>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<form action="addProduct" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label for="p_name" class=" col-form-label">Product Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="p_name" placeholder="Enter product name"
							name="p_name" required>
					</div>
				</div>
				<div class="form-group row">
					<label for="category" class=" col-form-label">Category &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<select class="custom-select my-1 mr-sm-2 col-sm-10" id="category" required name="category">
						<option>Choose...</option>
						<option value="fruitsVegi">Fruits & Vegitables</option>
						<option value="beverages">Beverages</option>
						<option value="snacks">Sancks</option>
						<option value="foodgrains">Foodgrains, Oil & Masala</option>
						<option value="cleaning">Cleaning & Household</option>
						<option value="beauty&hygiene">Beauty & Hygiene</option>
						<option value="babycare">Baby Care</option>
					</select>
				</div>
				<div class="form-group row">
					<label for="desc" class=" col-form-label">Description</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="desc" placeholder="Description" name="desc" required>
					</div>
				</div>
				<div class="form-group row">
					<label for="price" class=" col-form-label">Price &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="price" placeholder="Enter product price" name="price" required>
					</div>
				</div>
				<div class="form-group row">
					<label for="p_img" class=" col-form-label">Image&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="p_img" name="img" accept=".png, .jpeg, .jpg"
							required>
					</div>
				</div>
				<div class="form-group row">
					<div class="">Available stock?</div>
					<div class="col-sm-10">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="stock" value="yes" id="gridCheck1"
								checked>
							<label class="form-check-label" for="gridCheck1">
								Yes
							</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="form-check-input" type="radio" name="stock" value="no" id="gridCheck2">
							<label class="form-check-label" for="gridCheck2">
								No
							</label>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>

		</div>
		<div class="col-sm-3"></div>
	</div>
</body>
<script>
	setTimeout(() => {
		myFun();
	}, 2000);

	function myFun() {
		var x = document.getElementById("msg");
		x.style.display = "none";
	}
</script>
</html>