<html>
<head>
<title>Car Parking System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" media="all">

<style>
.ui-datepicker {
	font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
	font-size: 12px;
}
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
	float:left;
}
</style>
<script>
jQuery('document').ready(function() {
	jQuery("#Form").validate();
});
</script>
</head>
<body id="top">
<div class="wrapper row0">
  <div id="topbar" class="clear"> 
    <nav>
    </nav>
  </div>
</div>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <div id="logo" class="fl_left">
      <h1 style="font-size:36px;"><a href="index.jsp">Car Parking System</a></h1>
      <p style="color:#FFFFFF">A complete soulutin for parking management system</p>
    </div>
  </header>
</div>
<div class="wrapper row2">
  <div class="rounded">
    <nav id="mainav" class="clear"> 
      <ul class="clear">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a href="about-us.jsp">About Us</a></li>
        <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>
          <li><a href="login-home.jsp">Dashboard</a></li>
          <li><a href="car.jsp?car_id=0">Add Parking</a></li>
          <li><a href="report-car.jsp?emp_id=0">Parking Report</a></li>
		    <% } %>
		
		<% if(session.getAttribute("login_level") == null) { %>
      <li><a href="login.jsp?title=Adminstrator ">Administrator Login</a></li>
      <li><a href="contact-us.jsp">Contact Us</a></li>
		<% } %>
		<% if(session.getAttribute("login_level") != null) { %>
		<li><a href="change-password.jsp">Change Password</a></li>
		<% } %>
		<% if(session.getAttribute("login_level") != null) { %>
		<li><a href="model/login.jsp?act=logout">Logout</a></li>
		<% } %>
      </ul>
    </nav>
  </div>
</div>
