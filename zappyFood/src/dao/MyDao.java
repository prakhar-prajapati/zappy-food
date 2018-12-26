package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.productBean;

public class MyDao {
	// Mysql Connection Code
		public Connection start()
		{
			Connection con=null;
			try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db", "root", "root");
		}
		catch(Exception e) {
		  System.out.println(e);}
		return con;
		}
		
		
		//delete record
		public int delete(int pid)
		{
			int x=0;
			
			try {
				Connection con=start();
				PreparedStatement ps=con.prepareStatement("delete from account_details where cid=?");
				ps.setInt(1,pid);
				x= ps.executeUpdate();
		       con.close();
			}catch(SQLException w)
				{
				  System.out.println(w);
				}
			
			return x;
		}
		
//		
		//Display data
		public ArrayList<productBean> ShowData()
		{
			ArrayList<productBean> list=new ArrayList<>();

			try {
	               Connection con=start();
			  PreparedStatement ps=con.prepareStatement("select * from product_details");
			  
			  ResultSet rs=ps.executeQuery();
			while(rs.next())
			  { 
				productBean o=new productBean();
				o.setId(rs.getInt("pid"));
				o.setCategory(rs.getString("pcategory"));
				o.setName(rs.getString("pname"));
				o.setPrice(rs.getDouble("pprice"));  
				o.setDescription(rs.getString("pdescription"));
				o.setImage(rs.getString("pimage"));
				list.add(o);
				  
			 }
					}catch(Exception e)
			{
				System.out.println(e);
			}
			System.out.println(list);
	    return list;

		}
		

		
		
}
