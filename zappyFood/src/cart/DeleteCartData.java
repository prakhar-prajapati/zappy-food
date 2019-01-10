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
 * Servlet implementation class DeleteCartData
 */
@WebServlet("/DeleteCartData")
public class DeleteCartData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 MyDao m=new MyDao();
		 HttpSession session = request.getSession();
		 	String user = (String)session.getAttribute("uid");
 
		 int id =Integer.parseInt(request.getParameter("ccid"));
        int x=m.deleteCartProduct(id);
    if(x!=0)
    {
    	 ArrayList<joinCartBean>list=m. innerCartData(user);
 	   RequestDispatcher rd=request.getRequestDispatcher("viewCartServlet");
 	      request.setAttribute("List", list);
		    request.setAttribute("dmsg", "<h3>product deleted Successfully...</h3>");
 	   rd.forward(request, response);
    }		
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
