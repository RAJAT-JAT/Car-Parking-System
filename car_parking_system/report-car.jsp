<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Car carDetails = new Car();
	ArrayList allCar = carDetails.getAllCar(request.getParameter ("emp_id"));
%>
<script>
jQuery(document).ready(function() {
	jQuery('#mydatatable').DataTable();
} );
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Car Parking Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table id="mydatatable"  class="stripe hover row-border order-column">
          <thead>
            <tr>
              <th>Sr No.</th>
              <th>Car No</th>
              <th>Contact No</th>
              <th>Entry Date Time</th>
			  <th>Exit Date Time</th>
			  <th>Total Amount</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allCar.size();i++) 
			{ 
				HashMap CarDetails = new HashMap();
				CarDetails = (HashMap)allCar.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(i+1); %></td>
				  <td style="text-align:center;"><% out.print(CarDetails.get("car_number")); %></td>
				  <td><% out.print(CarDetails.get("car_contact")); %></td>
				  <td><% out.print(CarDetails.get("car_entry_date")+":"+CarDetails.get("car_entry_time")); %></td>
				  <td><% out.print(CarDetails.get("car_exit_date")+":"+CarDetails.get("car_exit_time")); %></td>
				  <td><% out.print(CarDetails.get("car_total_parking")); %></td>
				  <td> <a href="car.jsp?car_id=<% out.print(CarDetails.get("car_id")); %>">Edit</a> </td>
				</tr>
			<%
			}
			%>
			</tbody>
        </table>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
