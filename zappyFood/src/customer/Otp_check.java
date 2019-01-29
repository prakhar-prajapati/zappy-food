package customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;

/**
 * Servlet implementation class Otp_check
 */
@WebServlet("/Otp_check")
public class Otp_check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Otp_check() {
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
		MyDao m=new MyDao();
		String name=(String)request.getAttribute("name");
		
		PrintWriter out=response.getWriter();
		String OTP=request.getParameter("OTP");
        int x=m.OTPCheck(OTP);
        if(x==1)
        {
        //	response.sendRedirect("Pass_change.jsp");
        	RequestDispatcher rd=request.getRequestDispatcher("Pass_change.jsp");
	    	request.setAttribute("user", name);       
			rd.forward(request, response);
        }
        else
        	out.println("Wrong Otp");
	}

}
