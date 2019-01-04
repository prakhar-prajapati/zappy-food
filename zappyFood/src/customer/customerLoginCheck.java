package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class customerLoginCheck
 */
@WebServlet("/customerLoginCheck")
public class customerLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerLoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String u=request.getParameter("cname");
		String p=request.getParameter("cpass");
		// jdbc code
				try {
					Class.forName("com.mysql.jdbc.Driver");

					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db","root", "root");
		
					// prepared Statement
					PreparedStatement ps = con.prepareStatement("Select * from customerLogin where cname=? and cpassword=?");
					ps.setString(1, u);
					ps.setString(2, p);
					ResultSet rs=ps.executeQuery();
					int x = 0;
					if (rs.next())
						x = 1;
					if (x == 1) 
					{
						
//					//Session created   
						HttpSession session=request.getSession();
						session.setAttribute("uid",u);
						response.sendRedirect("customerHome.jsp");				
						}
					else {
						HttpSession session=request.getSession();
						session.setAttribute("msg","Wrong password... Try again.");
						//response.sendRedirect("Aindex.jsp");
					}
						
					}catch(ClassNotFoundException | SQLException e)
					{
						out.println(e);
					}
		
	}

}
