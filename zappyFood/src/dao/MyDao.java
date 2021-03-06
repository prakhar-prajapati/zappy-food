package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.cartBean;
import bean.joinCartBean;
import bean.orderBean;
import bean.productBean;

public class MyDao {
	
	// Mysql Connection Code
	public Connection start() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	
	
	
	//cart update
	 public int cartUpdate(String user , String ip)
	 {
		 int x=0;
		 try {
			 Connection con=start();
			 PreparedStatement ps = con.prepareStatement("Update cart set user=? where user=?");
				ps.setString(1,user);
				ps.setString(2,ip);
			x=ps.executeUpdate();
			con.close();
			
		 }catch(Exception e)
		 {
			 System.out.println(e);
		 }
		 return x;
	 }
	
	//cart count
		 public int cartCount(String user)
		 { int count=0;
			 try {
			 Connection con = start();
			 PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM cart WHERE USER=?");
			ps.setString(1,user);
			System.out.println(user);
			 ResultSet rs = ps.executeQuery();
		     if(rs.next())
		     {
		    	 count=rs.getInt("COUNT(*)");
		     }
		     
		 }catch(Exception e)
		 {
			 System.out.println(e);
		 }
				 return count;
		 }
		

	//user login
	public int UserLoginCheck(String u , String p)	 
	{
		int x=0;
	
		try {
			
			Connection con =start(); 
			// prepared Statement
			PreparedStatement ps = con.prepareStatement("Select * from customerLogin where cname=? and cpassword=?");
			ps.setString(1, u);
			ps.setString(2, p);
			ResultSet rs=ps.executeQuery();
             x=0;
			if(rs.next())
           x=1;
	}catch(Exception e)
		{
		System.out.println(e);
		}
		return x;
	}
		 
	
	// delete record from product_details table
	public int delete(int pid) {
		int x = 0;

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("delete from product_details where pid=?");
			ps.setInt(1, pid);
			x = ps.executeUpdate();
			con.close();
		} catch (SQLException w) {
			System.out.println(w);
		}

		return x;
	}

	// delete record from cart table
		public int deleteCartProduct(int id) {
			int x = 0;

			try {
				Connection con = start();
				PreparedStatement ps = con.prepareStatement("delete from cart where id=?");
				ps.setInt(1, id);
				x = ps.executeUpdate();
				con.close();
			} catch (SQLException w) {
				System.out.println(w);
			}

			return x;
		}

	
	
	
	// Display product details in admin panel
	public ArrayList<productBean> ShowData() {
		ArrayList<productBean> list = new ArrayList<>();

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("select * from product_details");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				productBean o = new productBean();
				o.setId(rs.getInt("pid"));
				o.setCategory(rs.getString("pcategory"));
				o.setName(rs.getString("pname"));
				o.setPrice(rs.getDouble("pprice"));
				o.setDescription(rs.getString("pdescription"));
				o.setImage(rs.getString("pimage"));
				list.add(o);

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(list);
		return list;
	}

	// Display Cart data using inner join
	public ArrayList<joinCartBean> innerCartData(String user) {

		ArrayList<joinCartBean> list = new ArrayList<>();
		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("Select c.pid, p.pimage,p.pname,p.pprice,c.quantity, c.id FROM product_details p,cart c WHERE p.pid=c.pid And c.user=? ");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				joinCartBean o = new joinCartBean();
				o.setPid(rs.getInt(1));
				o.setImage(rs.getString(2));
				o.setName(rs.getString(3));
				o.setPrice(rs.getDouble(4));
				o.setQuantity(rs.getInt(5));
				o.setId(rs.getInt(6));
				
				list.add(o);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}

	// insert product data from admin panel
	public int insert(productBean e) {
		int y = 0;
		try {
			 Connection con=start();
			 PreparedStatement ps = con.prepareStatement(
					"insert into product_details(pcategory,pname,pprice,pdescription,pimage) value(?,?,?,?,?)");// placeholder
		    ps.setString(1, e.getCategory());
			ps.setString(2, e.getName());
			ps.setDouble(3, e.getPrice());
			ps.setString(4, e.getDescription());
			ps.setString(5, e.getImage());

			y = ps.executeUpdate();
			con.close();
		} catch (Exception w) {
			System.out.println(w);
		}
		return y;
	}

	// update image from admin panel
	public int updateimg(productBean e) {
		int x = 0;

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("update product_details set pimage=? where pid=?");
			ps.setString(1, e.getImage());
			ps.setInt(2, e.getId());
			System.out.println("dao" + e.getId());
			// System.out.println(e.getImage());

			x = ps.executeUpdate();
			con.close();
		} catch (SQLException w) {
			System.out.println(w);
		}
		System.out.println("update method call");
		return x;
	}

	// update product details from admin panel
	public int updateData(productBean e) {
		int x = 0;

		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement(
					"update product_details set pcategory=?,pname=?,pprice=?,pdescription=? where pid=?");
			ps.setString(1, e.getCategory());
			ps.setString(2, e.getName());
			ps.setDouble(3, e.getPrice());
			ps.setString(4, e.getDescription());
			ps.setInt(5, e.getId());
			System.out.println(e.getId());

			// ps.setString(5, e.getImage());
			x = ps.executeUpdate();
			con.close();
		} catch (SQLException w) {
			System.out.println(w);
		}
		System.out.println("update method call");
		return x;
	}

	//get all data from product table nd display in feild for update purpose in admin panel
	public productBean getEmpDetailsByEid(int pid) {
		productBean e = new productBean();
		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("select * from product_details where pid=?");
			ps.setInt(1, pid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				e.setId(rs.getInt("pid"));
				e.setCategory(rs.getString("pcategory"));
				e.setName(rs.getString("pname"));
				e.setPrice(rs.getDouble("pprice"));
				e.setDescription(rs.getString("pdescription"));
				e.setImage(rs.getString("pimage"));
				System.out.println(rs.getString("pimage"));
			}
			con.close();
		} catch (SQLException w) {
			System.out.println(w);
		}
		System.out.println(e);
		return e;
	}

	// customer sginup insert
	public int customerInsert(productBean e) {
		int y = 0;
		try {
			Connection con = start();
			PreparedStatement ps = con
					.prepareStatement("insert into customerLogin(cname,cmail,cpassword,caddress) value(?,?,?,?)");// placeholder
			ps.setString(1, e.getCname());
			ps.setString(2, e.getCemail());
			ps.setString(3, e.getCpassword());
			ps.setString(4, e.getCaddress());
			System.out.println(e.getCaddress());
			y = ps.executeUpdate();
			con.close();
		} catch (Exception w) {
			System.out.println(w);
		}
		return y;
	}

	// insert cart
	public int insertcart(productBean e) {
		int y = 0;
		
		try {
			Connection con = start();
			PreparedStatement ps = con.prepareStatement("insert into cart(pid,quantity,user) value(?,?,?)");// placeholder
        	ps.setInt(1, e.getId());
			ps.setInt(2, Integer.parseInt(e.getQuantity()));
			ps.setString(3, e.getName());
			System.out.println(e.getName());
			y = ps.executeUpdate();
			con.close();
		} catch (Exception w) {
			System.out.println(w);
		}
		return y;
	}
	
	//cart check
		public int quantityCheck(String id , String user)	 
		{
			int x=0;
		
			try {
				
				Connection con =start(); 
				// prepared Statement
				PreparedStatement ps = con.prepareStatement("Select * from cart where pid=? and user=?");
				ps.setInt(1, Integer.parseInt(id));
				ps.setString(2, user);
				ResultSet rs=ps.executeQuery();
	             x=0;
				if(rs.next())
	           x=1;
		}catch(Exception e)
			{
			System.out.println(e);
			}
			return x;
		}
			
		//cart quantity update
		public int updateQuantityViaCart(productBean e,String quantity) {
			int x = 0;
      	try {
      		
      		int q=Integer.parseInt(quantity);
    			Connection con = start();
				PreparedStatement ps = con.prepareStatement("update cart set quantity=quantity+? where user=? and pid=?");
				ps.setInt(1, Integer.parseInt(quantity));
				ps.setString(2, e.getName());
				ps.setInt(3, e.getId());
					
				x = ps.executeUpdate();
				System.out.println(ps);
				con.close();
			} catch (SQLException w) {
				System.out.println(w);
			}
			System.out.println("update method call");
			return x;
		}


	
	////////////
	
	//display data sepratly in index1 jsp page
	public ArrayList<productBean>   viewProductreadytocook()
	{
		ArrayList<productBean> list=new ArrayList<>();
		try {
			
			Connection con=start();
			PreparedStatement ps=con.prepareStatement("select pid,pcategory,pname,pprice,pimage from product_details WHERE pcategory = 'ready to cook'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
				
			{ 
				productBean e=new productBean();
				e.setId(rs.getInt("pid"));
				e.setCategory(rs.getString("pcategory"));
				e.setName(rs.getString("pname"));
				e.setPrice(rs.getDouble("pprice"));
				
				e.setImage(rs.getString("pimage"));
				

				list.add(e);
		     }
			con.close();
		}catch( SQLException w)
			{
			  System.out.println(w);
			}
	return list;
		
	}
	public ArrayList<productBean>   viewProductreadytoeat()
	{
		ArrayList<productBean> list=new ArrayList<>();
		try(Connection con=start()) {
			
			
			PreparedStatement ps=con.prepareStatement("select pid,pcategory,pname,pprice,pimage from product_details WHERE pcategory = 'ready to eat'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
				
			{ 
				productBean e=new productBean();
				e.setId(rs.getInt("pid"));
				e.setCategory(rs.getString("pcategory"));
				e.setName(rs.getString("pname"));
				e.setPrice(rs.getDouble("pprice"));
				e.setImage(rs.getString("pimage"));
				

				list.add(e);
		     }
			//con.close();
		}catch( SQLException w)
			{
			  System.out.println(w);
			}
	return list;
		
	}	
	public ArrayList<productBean>   viewProductreadytodrink()
	{
		ArrayList<productBean> list=new ArrayList<>();
		try {
			
			Connection con=start();
			PreparedStatement ps=con.prepareStatement("select pid,pcategory,pname,pprice,pimage from product_details WHERE pcategory = 'ready to drink'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
				
			{ 
				productBean e=new productBean();
				e.setId(rs.getInt("pid"));
				e.setCategory(rs.getString("pcategory"));
				e.setName(rs.getString("pname"));
				e.setPrice(rs.getDouble("pprice"));
				
				e.setImage(rs.getString("pimage"));
				

				list.add(e);
		     }
			con.close();
		}catch( SQLException w)
			{
			  System.out.println(w);
			}
	return list;
		
	}
	
//grand total for cart 
	public ArrayList<joinCartBean>   grandTotal(String user)
	{
		ArrayList<joinCartBean> list=new ArrayList<>();
		joinCartBean e=new joinCartBean();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db", "root", "root");

			PreparedStatement ps = con.prepareStatement("SELECT SUM(c.quantity * p.pprice) FROM cart c ,product_details p WHERE c.pid=p.pid AND c.user=?;");// placeholder
			ps.setString(1, user);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				e.setGrandTotal(rs.getInt("SUM(c.quantity * p.pprice)"));
				list.add(e);
			}
			
			con.close();
		} catch (Exception w) {
			System.out.println(w);
		}
		return list;
	}
	
	//ajax grand total
	public int   gTotal(String user)
	{
		int gtot=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db", "root", "root");

			PreparedStatement ps = con.prepareStatement("SELECT SUM(c.quantity * p.pprice) FROM cart c ,product_details p WHERE c.pid=p.pid AND c.user=?;");// placeholder
			ps.setString(1, user);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				gtot=rs.getInt(1);
			}
			
			con.close();
		} catch (Exception w) {
			System.out.println(w);
		}
		return gtot;
	}
	
	// show product discription
	public ArrayList<productBean>   productdesc(int pid)
	{
		ArrayList<productBean> list=new ArrayList<>();
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db", "root", "root");
   
			PreparedStatement ps = con.prepareStatement("SELECT * from product_details where pid=? ");// placeholder
			ps.setInt(1, pid);
			ResultSet rs=ps.executeQuery();
			System.out.println(pid);
			System.out.println(ps);

           while(rs.next())
				
			{ 
				productBean e=new productBean();
				e.setId(rs.getInt("pid"));
				e.setCategory(rs.getString("pcategory"));
				e.setName(rs.getString("pname"));
				e.setPrice(rs.getDouble("pprice"));
				e.setDescription(rs.getString("pdescription"));
				e.setImage(rs.getString("pimage"));
				

				list.add(e);
		     }

			con.close();
		} catch (Exception w) {
			System.out.println(w);
		}
		return list;
	}
	

//Ajax singup validation
	public String checkName(String name)
	{
		String msg=null;
		
		try
		{	
			int x=0;
			Connection con =start(); 
					String sql = "select * from customerlogin  where cname=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				x=1;
			}
			if(x==1)
				msg="<font color=red>Already Exist</font>";
			else
				msg="<font color=green>Avaliable</font>";
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	     return msg;
	}


	
	//Ajax insert product name  validation check
		public String checkProductName(String name)
		{
			String msg=null;
			
			try
			{	
				int x=0;
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db", "root", "root");
			     String sql = "select * from product_details where pname=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, name);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					x=1;
				}
				if(x==1)
					msg="<font color=red>Already Exist</font>";
				else
					msg="<font color=green>Avaliable</font>";
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			
		     return msg;
		}

		//change quantity into cart using ajax
				public int ChangeQuantity(String cid,String quantity) {
					int x = 0;
		      	try {
		      			Connection con = start();
						PreparedStatement ps = con.prepareStatement("update cart set quantity=? where id=?");
						ps.setInt(1, Integer.parseInt(quantity));
						ps.setInt(2,Integer.parseInt(cid));
							
						x = ps.executeUpdate();
						System.out.println(ps);
						con.close();
					} catch (SQLException w) {
						System.out.println(w);
					}
					System.out.println("update method call");
					return x;
				}


   
				//check out set data into beans from cart
				public ArrayList<cartBean> checkOut(String user,String add) {

					ArrayList<cartBean> list = new ArrayList<>();
					try {
						Connection con = start();
						PreparedStatement ps = con.prepareStatement("Select c.pid,c.quantity,c.user,p.pprice FROM cart c ,product_details p WHERE c.pid=p.pid and user=? ");
						ps.setString(1, user);
						ResultSet rs = ps.executeQuery();
						System.out.println(ps);
						while (rs.next()) 
						{  
							
							checkOut_insert(rs.getInt(1) ,rs.getInt(2),rs.getString(3),add,rs.getInt(4));
							
						/*	cartBean o = new cartBean();
							o.setPid(rs.getInt(1));
							o.setQuantity(rs.getInt(2));
							o.setUser(rs.getString(3));
							list.add(o);
							System.out.println(ps);*/	
							
						
						}
						deletecart(user);
						con.close();
					} 
					
					catch (Exception e) {
						System.out.println(e);
					}

					return list;
				}
				
				
				// insert into order table after check out
				public int checkOut_insert(int pid,int quan,String user,String address,int price) {
					int y = 0;
					try {
						Connection con =start();
						PreparedStatement ps = con.prepareStatement("insert into ordertable(pid,quantity,total,user,address,status) value(?,?,?,?,?,?)");// placeholder
						ps.setInt(1,pid);
						ps.setDouble(2, quan);
						ps.setInt(3,price);
						ps.setString(4, user);
						ps.setString(5, address);
						ps.setString(6, "0");
						System.out.println(ps);
						y = ps.executeUpdate();
						con.close();
					} catch (Exception w) {
						System.out.println(w);
					}
					return y;
				}
		
				public int deletecart(String user) {
					int x = 0;

					try {
						Connection con = start();
						PreparedStatement ps = con.prepareStatement("delete from cart where user=?");
						ps.setString(1, user);
						x = ps.executeUpdate();
						con.close();
					} catch (SQLException w) {
						System.out.println(w);
					}

					return x;
				}
				
				
				
				
				// Display order data in admin panel who is panding
				public ArrayList<orderBean> ShowOrder() {
					ArrayList<orderBean> list = new ArrayList<>();

					try {
						Connection con = start();
						PreparedStatement ps = con.prepareStatement("select * from ordertable where status=? order by oid desc");
						ps.setInt(1,0);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							orderBean o = new orderBean();
							o.setOid(rs.getInt("oid"));
							o.setPid(rs.getInt("pid"));
							o.setQuantity(rs.getInt("quantity"));
							o.setTotal(rs.getDouble("total"));
							o.setAddress(rs.getString("address"));
							o.setUser(rs.getString("user"));
							o.setStatus(rs.getInt("status"));
							list.add(o);

						}
					} catch (Exception e) {
						System.out.println(e);
					}
					System.out.println(list);
					return list;
				}
			

				
				// Display order history in admin panel who is not panding
				public ArrayList<orderBean> ShowOrderHistory() {
					ArrayList<orderBean> list = new ArrayList<>();

					try {
						Connection con = start();
						PreparedStatement ps = con.prepareStatement("select * from ordertable where status!=0 order by oid desc");
//						ps.setInt(1,0);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							orderBean o = new orderBean();
							o.setOid(rs.getInt("oid"));
							o.setPid(rs.getInt("pid"));
							o.setQuantity(rs.getInt("quantity"));
							o.setTotal(rs.getDouble("total"));
							o.setAddress(rs.getString("address"));
							o.setUser(rs.getString("user"));
							o.setStatus(rs.getInt("status"));
							o.setDatetime(rs.getString("datetime"));
							list.add(o);
                        System.out.println(ps);
						}
					} catch (Exception e) {
						System.out.println(e);
					}
					System.out.println(list);
					return list;
				}

				//product dispatch
						public int productDispatch(int oid) {
							int x = 0;
				      	try {
				      			Connection con = start();
								PreparedStatement ps = con.prepareStatement("update ordertable set status=? where oid=?");
								ps.setInt(1, 1);
								ps.setInt(2,oid);
									
								x = ps.executeUpdate();
								System.out.println(ps);
								con.close();
							} catch (SQLException w) {
								System.out.println(w);
							}
							System.out.println("update method call");
							return x;
						}
				

						//product Not-available
								public int product_Notavailable(int oid) {
									int x = 0;
						      	try {
						      			Connection con = start();
										PreparedStatement ps = con.prepareStatement("update ordertable set status=? where oid=?");
										ps.setInt(1, 2);
										ps.setInt(2,oid);
											
										x = ps.executeUpdate();
										System.out.println(ps);
										con.close();
									} catch (SQLException w) {
										System.out.println(w);
									}
									System.out.println("update method call");
									return x;
								}

								
								
								

								// Display all order of user 
								public ArrayList<orderBean> Show_User_Order(String user)
								{
									ArrayList<orderBean> list = new ArrayList<>();

									try {
										Connection con = start();
										PreparedStatement ps = con.prepareStatement("select * from ordertable where user=? order by oid desc");
										ps.setString(1, user);
										ResultSet rs = ps.executeQuery();
										while (rs.next()) {
											orderBean o = new orderBean();
											o.setOid(rs.getInt("oid"));
											o.setPid(rs.getInt("pid"));
											o.setQuantity(rs.getInt("quantity"));
											o.setTotal(rs.getDouble("total"));
											o.setAddress(rs.getString("address"));
											o.setUser(rs.getString("user"));
											o.setStatus(rs.getInt("status"));
											o.setDatetime(rs.getString("datetime"));
											list.add(o);

										}
									} catch (Exception e) {
										System.out.println(e);
									}
									System.out.println(list);
									return list;
								}
						
				
								//get email id for email sending purpose
								public String sendEmail(String user) {
									String email = null;
						      	try {
						      			Connection con = start();
										PreparedStatement ps = con.prepareStatement("Select cmail from customerlogin where cname=?");
										ps.setString(1,user);
										System.out.println(ps);
										System.out.println("send email  dao call");
										ResultSet rs=ps.executeQuery();
										if(rs.next())
										{
										email=rs.getString(1);
										}
											con.close();
									} catch (SQLException w) {
										System.out.println(w);
									}
									return email;
								}
					
								//get password  for forget password for email sending
								public String sendPasswprd(String user) {
									String password = null;
						      	try {
						      			Connection con = start();
										PreparedStatement ps = con.prepareStatement("Select cpassword from customerlogin where cname=?");
										ps.setString(1,user);
										System.out.println(ps);
										System.out.println("send password dao call");
										ResultSet rs=ps.executeQuery();
										if(rs.next())
										{
											password=rs.getString(1);
										}
											con.close();
									} catch (SQLException w) {
										System.out.println(w);
									}
									return password;
								}
					

								//OTP insert into mysql
								public int InsertOTP(String user,String OTP) {
									int x=0;
						      	try {
						      			Connection con = start();
										PreparedStatement ps = con.prepareStatement("Update customerlogin set Otp=? where cname=?");
										ps.setString(1,OTP);
										ps.setString(2,user);
										System.out.println(ps);
										System.out.println("insert OTP dao call");
										 x=ps.executeUpdate();
										con.close();
									} catch (SQLException w) {
										System.out.println(w);
									}
									return x;
								}
								
								//OTP check
								public int OTPCheck(String otp)	 
								{
									int x=0;
								
									try {
										
										Connection con =start(); 
										// prepared Statement
										PreparedStatement ps = con.prepareStatement("Select * from customerlogin where OTP=? ");
										ps.setString(1,otp);
										ResultSet rs=ps.executeQuery();
							             x=0;
										if(rs.next())
							           x=1;
								}catch(Exception e)
									{
									System.out.println(e);
									}
									return x;
								}
								
	
								//password update
								 public int Change_pass(String pass , String name)
								 {
									 int x=0;
									 try {
										 Connection con=start();
										 PreparedStatement ps = con.prepareStatement("Update customerlogin set cpassword=? where cname=?");
											ps.setString(1,pass);
											ps.setString(2,name);
										x=ps.executeUpdate();
										System.out.println(ps);
										con.close();
										
									 }catch(Exception e)
									 {
										 System.out.println(e);
									 }
									 return x;
								 }
									
								
								
}