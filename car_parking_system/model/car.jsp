<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Car carObj = new Car();
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		
		results.put("car_id",request.getParameter("car_id"));
		results.put("car_number",request.getParameter("car_number"));
		results.put("car_entry_time",request.getParameter("car_entry_time"));
		results.put("car_entry_date",request.getParameter("car_entry_date"));
		results.put("car_contact",request.getParameter("car_contact"));
		results.put("car_total_parking",request.getParameter("car_total_parking"));
		results.put("car_exit_time",request.getParameter("car_exit_time"));
		results.put("car_exit_date",request.getParameter("car_exit_date"));

		
		if((request.getParameter("car_id")).equals(""))
		{
			out.println(carObj.saveCar(results));
			response.sendRedirect("../report-car.jsp?emp_id=0&msg=Car Saved Successfully");
		}
		else
		{
			results.put("car_id",request.getParameter("car_id"));
			out.println(carObj.updateCar(results));
			response.sendRedirect("../report-car.jsp?emp_id=0&msg=Car Updated Successfully");
		}
	}
	if((request.getParameter("act")).equals("delete"))
	{
		int pay_id = Integer.parseInt(request.getParameter("car_id"));
		if(carObj.delete_login(pay_id))
			response.sendRedirect("../register.jsp?msg=Record Deleted Successfully");
		else
			response.sendRedirect("../register.jsp?msg=Problem in Deletion.");
	}
%>
