package customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyDao;

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
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("uid");
		String ip=request.getRemoteAddr();
        System.out.println(ip);
		MyDao m=new MyDao();
		int x=m.UserLoginCheck(u, p);
		int y=m.cartUpdate(u,ip);
					if (x == 1 || y==1) 
					{
						
						session.setAttribute("uid",u);
						
						int count=m.cartCount(user);
						request.setAttribute("count", count);
						response.sendRedirect("index.jsp");
						
						System.out.println(count);   
				     }
					else {
						
						session.setAttribute("msg","Wrong password... Try again.");
						//response.sendRedirect("Aindex.jsp");
					}
						
					
	}

}
