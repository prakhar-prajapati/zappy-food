package customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.productBean;
import dao.MyDao;

/**
 * Servlet implementation class signUp
 */
@WebServlet("/signUp")
public class signUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signUp() {
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
		String name=request.getParameter("cname");
		String email=request.getParameter("cemail");
		String address=request.getParameter("caddress");
		String password=request.getParameter("cpassword");
		//
	try {
		productBean e=new productBean();
		e.setCname(name);;
		e.setCemail(email);
		e.setCaddress(address);
		e.setCpassword(password);
	
		   MyDao obj=new MyDao();
		   int y=obj.customerInsert(e);
		    if(y!=0)
		    {
		   RequestDispatcher rd=request.getRequestDispatcher("customerSignUp.jsp"); 
		   request.setAttribute("msg", "<h2>Sign-up successfully...</h2>");	
		 	rd.forward(request, response);
		    }
		  }catch(Exception w)
		  {
		      w.printStackTrace();
		     System.out.println(w);
		 }

		
	}

}
