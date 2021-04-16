<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Car carDetails = new Car();
	int car_id = Integer.parseInt(request.getParameter ("car_id"));
	HashMap Values =  carDetails.getCarDetails(car_id);
%>
<script>
  jQuery(function() {
    jQuery( "#car_exit_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-0:+1",
       dateFormat: 'd MM,yy'
    });
     jQuery( "#car_entry_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-0:+1",
       dateFormat: 'd MM,yy'
    });
  });
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Car Parking Entry Form</h2>
        <form action="model/car.jsp" method="post">
          <div class="half_width">
            <label for="email">Car Number<span>*</span></label>
            <input type="text" name="car_number" id="car_number" value="<% out.print(Values.get("car_number")); %>" size="22" style="width:300px;" required>
          </div>
           <div class="half_width">
            <label for="email">Entry Date<span>*</span></label>
            <input type="text" name="car_entry_date" id="car_entry_date" value="<% out.print(Values.get("car_entry_date")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">Entry Time<span>*</span></label>
            <input type="text" name="car_entry_time" id="car_entry_time" value="<% out.print(Values.get("car_entry_time")); %>" size="22" style="width:300px;" required>
          </div>
           <div class="half_width">
            <label for="email">Contact No<span>*</span></label>
            <input type="text" name="car_contact" id="car_contact" value="<% out.print(Values.get("car_contact")); %>" size="22" style="width:300px;" required>
          </div>
          <% if(car_id != 0) { %> 
          <div style="clear:both"></div>
		      <h4 class="heading colr">Car Exit Entry</h4>
          <div class="half_width">
            <label for="email">Total Amount Paid<span>*</span></label>
            <input type="text" name="car_total_parking" id="car_total_parking" value="<% out.print(Values.get("car_total_parking")); %>" size="22" style="width:300px;" required>
          </div>
           <div class="half_width">
            <label for="email">Exit Date<span>*</span></label>
            <input type="text" name="car_exit_date" id="car_exit_date" value="<% out.print(Values.get("car_exit_date")); %>" size="22" style="width:300px;" required>
          </div>
           <div class="half_width">
            <label for="email">Exit Time<span>*</span></label>
            <input type="text" name="car_exit_time" id="car_exit_time" value="<% out.print(Values.get("car_exit_time")); %>" size="22" style="width:300px;" required>
          </div>
          <% } %>
          <div class="block clear"></div>
          <div class="half_width">
            <input name="submit" type="submit" value="Save Car Parking">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="car_id" value="<% out.print(Values.get("car_id")); %>"/>
        </form>
        </div>
        <div style="float: left">
        	<div class="half_width"><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div class="half_width"><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
