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
				PreparedStatement ps=con.prepareStatement("delete from product_details where pid=?");
				ps.setInt(1,pid);
				x= ps.executeUpdate();
		       con.close();
			}catch(SQLException w)
				{
				  System.out.println(w);
				}
			
			return x;
		}
		
		
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
		
//insert
     public int insert(productBean e)
    {int y=0;
	    try {
		  	  Class.forName("com.mysql.jdbc.Driver");
		  	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db","root","root");

	  	  PreparedStatement ps=con.prepareStatement("insert into product_details(pcategory,pname,pprice,pdescription,pimage) value(?,?,?,?,?)");//placeholder
	  	   
		   ps.setString(2,e.getName());
	  	    ps.setDouble(3,e.getPrice());
	  	    ps.setString(4,e.getDescription());
	  	  ps.setString(1,e.getCategory());
	  	    ps.setString(5,e.getImage());
	  	    
	  	    y=ps.executeUpdate();
	          con.close();
	    }catch(Exception w)
	    {
	  	  System.out.println(w);
	    }
	    return y;
    }

     
     
   //update image
   		public int updateimg(productBean e)
   		{	int x=0;
   			
   			try {
   				Connection con=start();
   				PreparedStatement ps=con.prepareStatement("update product_details set pimage=? where pid=?");
   				ps.setString(1, e.getImage());
   				ps.setInt(2,e.getId());
   				System.out.println("dao"+e.getId());
   				//System.out.println(e.getImage());
   				
   				x= ps.executeUpdate();
   		       con.close();
   			}catch(SQLException w)
   				{
   				  System.out.println(w);
   				}
   			System.out.println("update method call");
   			return x;
   		}
   			    
     
     
//update data
		public int updateData(productBean e)
		{	int x=0;
			
			try {
				Connection con=start();
				PreparedStatement ps=con.prepareStatement("update product_details set pcategory=?,pname=?,pprice=?,pdescription=? where pid=?");
				ps.setString(1,e.getCategory());
				ps.setString(2, e.getName());
				ps.setDouble(3, e.getPrice());
				ps.setString(4, e.getDescription());
				ps.setInt(5,e.getId());
				System.out.println(e.getId());
				
				//ps.setString(5, e.getImage());
				x= ps.executeUpdate();
		       con.close();
			}catch(SQLException w)
				{
				  System.out.println(w);
				}
			System.out.println("update method call");
			return x;
		}
			
		
		public  productBean getEmpDetailsByEid(int pid)
		{
			productBean e=new productBean();
			try {
				Connection con=start();
				PreparedStatement ps=con.prepareStatement("select * from product_details where pid=?");
				ps.setInt(1,pid);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{ 
					
					e.setId(rs.getInt("pid"));
					e.setCategory(rs.getString("pcategory"));
					e.setName(rs.getString("pname"));
					e.setPrice(rs.getDouble("pprice"));
					e.setDescription(rs.getString("pdescription"));
					e.setImage(rs.getString("pimage"));
			     System.out.println(rs.getString("pimage"));
				}
				con.close();
			}catch(SQLException w)
				{
				  System.out.println(w);
				}
			System.out.println(e);
			return e;
		}

// customer singup insert
		 public int customerInsert(productBean e)
		    {int y=0;
			    try {
			    	Connection con=start();
				 PreparedStatement ps=con.prepareStatement("insert into customerLogin(cname,cmail,cpassword,caddress) value(?,?,?,?)");//placeholder
			  	   ps.setString(1,e.getCname());
			  	    ps.setString(2,e.getCemail());
			  	  ps.setString(3,e.getCpassword());
			  	    ps.setString(4,e.getCaddress());
			  	    System.out.println(e.getCaddress());
			  	    y=ps.executeUpdate();
			          con.close();
			    }catch(Exception w)
			    {
			  	  System.out.println(w);
			    }
			    return y;
		    }


}
