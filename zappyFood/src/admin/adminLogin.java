package admin;

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
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLogin() {
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
		String u=request.getParameter("aid");
		String p=request.getParameter("apass");
		//Session created
		
		
		// jdbc code
				try {
					Class.forName("com.mysql.jdbc.Driver");

					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db","root", "root");
		
					// prepared Statement
					PreparedStatement ps = con.prepareStatement("Select * from adminLogin where adminid=? and apassword=?");
					ps.setString(1, u);
					ps.setString(2, p);
					ResultSet rs=ps.executeQuery();
					int x = 0;
					if (rs.next())
						x = 1;
					if (x == 1) 
					{
					//Session created   
						HttpSession session=request.getSession();
						session.setAttribute("msg",u);
						
						response.sendRedirect("AdminHome.jsp");				
						}
					else {
						HttpSession session=request.getSession();
						session.setAttribute("msg","Wrong password... Try again.");
						response.sendRedirect("Aindex.jsp");
					}
						
					}catch(ClassNotFoundException | SQLException e)
					{
						out.println(e);
					}
				
         	}

	}


