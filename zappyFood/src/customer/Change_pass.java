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
 * Servlet implementation class Change_pass
 */
@WebServlet("/Change_pass")
public class Change_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Change_pass() {
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
		PrintWriter out=response.getWriter();
		//String name=(String)request.getAttribute("user");
		
		HttpSession session=request.getSession();
		 String name=(String)session.getAttribute("name");      
		
		 //String name=request.getParameter("cname");
        String newPass=request.getParameter("npass");
		int x=m.Change_pass(newPass, name);
		if(x==1)
		{
			out.println("password change successfully..");
		}else
			out.println("password  not change successfully..");
        
	      session.invalidate();
	}

}
