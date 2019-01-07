package cart;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.joinCartBean;
import dao.MyDao;

/**
 * Servlet implementation class viewCartServlet
 */
@WebServlet("/viewCartServlet")
public class viewCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	MyDao obj=new MyDao();
		 	HttpSession session = request.getSession();
		 	String user = (String)session.getAttribute("uid");
		 	if(user==null)
		 	{
		 		user=request.getRemoteAddr();
		 	}
		 	
	     	ArrayList<joinCartBean> list=obj.innerCartData(user);
	     	ArrayList<joinCartBean> listt=obj.grandTotal(user);
	        RequestDispatcher rd=request.getRequestDispatcher("viewCart.jsp");
	        request.setAttribute("List", list);
	        request.setAttribute("Listt", listt);
			rd.forward(request, response);	
			
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
