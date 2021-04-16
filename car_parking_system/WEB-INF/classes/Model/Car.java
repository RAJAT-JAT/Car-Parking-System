package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Car extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Car()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveCar(HashMap carData)
	{
		String SQL = "INSERT INTO `car` (`car_number`, `car_entry_date`, `car_entry_time`, `car_contact`, `car_total_parking`, `car_exit_time`, `car_exit_date`) VALUES (?, ?, ?, ?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) carData.get("car_number"));
			pstmt.setString(2,(String) carData.get("car_entry_date"));
			pstmt.setString(3,(String) carData.get("car_entry_time"));
			pstmt.setString(4,(String) carData.get("car_contact"));
			pstmt.setString(5, "NA");
			pstmt.setString(6, "NA");
			pstmt.setString(7, "NA");
		
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	//////////////////Function for getting Users Details//////////	
    public HashMap getCarDetails(int car_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM car WHERE car_id = "+car_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("car_id",rs.getString("car_id"));
				results.put("car_number",rs.getString("car_number"));
				results.put("car_entry_time",rs.getString("car_entry_time"));
				results.put("car_entry_date",rs.getString("car_entry_date"));
				results.put("car_contact",rs.getString("car_contact"));
				results.put("car_total_parking",rs.getString("car_total_parking"));
				results.put("car_exit_time",rs.getString("car_exit_time"));
				results.put("car_exit_date",rs.getString("car_exit_date"));
				count++;
            }
			if(count==0)
			{
				results.put("car_id","");
				results.put("car_number","");
				results.put("car_entry_time","");
				results.put("car_entry_date","");
				results.put("car_contact","");
				results.put("car_total_parking","NA");
				results.put("car_exit_time","NA");
				results.put("car_exit_date","NA");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    
	//////////////////Function for getting Users Details//////////	
    public String getMonth(int mon_id)
	{
        HashMap results = new HashMap();
        String SQL = "";
        String value = "";
        int count=0;
		try
		{
            SQL =  "SELECT month_name FROM month WHERE month_id = "+mon_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				value = rs.getString("month_name");
            }
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return value;
    }
    
	public String updateCar(HashMap carData)
	{
		String SQL = "UPDATE `car` SET `car_number` = ?, `car_entry_date` = ?, `car_entry_time` = ?, `car_contact` = ?, `car_total_parking` = ?, `car_exit_time` = ?, `car_exit_date` = ? WHERE `car`.`car_id` = ?";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) carData.get("car_number"));
			pstmt.setString(2,(String) carData.get("car_entry_date"));
			pstmt.setString(3,(String) carData.get("car_entry_time"));
			pstmt.setString(4,(String) carData.get("car_contact"));
			pstmt.setString(5,(String) carData.get("car_total_parking"));
			pstmt.setString(6,(String) carData.get("car_exit_time"));
			pstmt.setString(7,(String) carData.get("car_exit_date"));
			pstmt.setString(8,(String) carData.get("car_id"));
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	public boolean delete_login(int airline_id)
	{
		return true;
	}

	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllCar(String emp_id)
	{
		String SQL = "SELECT * FROM car";
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();		
				
				results.put("car_id",rs.getString("car_id"));
				results.put("car_number",rs.getString("car_number"));
				results.put("car_entry_time",rs.getString("car_entry_time"));
				results.put("car_entry_date",rs.getString("car_entry_date"));
				results.put("car_contact",rs.getString("car_contact"));
				results.put("car_total_parking",rs.getString("car_total_parking"));
				results.put("car_exit_time",rs.getString("car_exit_time"));
				results.put("car_exit_date",rs.getString("car_exit_date"));
		
				count++;
                resultArray.add(results);
            }
         }
		catch(Exception e)
		{
            System.out.println("Error is: "+ e);
        }
        return resultArray;
    }
}
