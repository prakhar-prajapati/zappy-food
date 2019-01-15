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

import bean.cartBean;
import dao.MyDao;

/**
 * Servlet implementation class Check_Out
 */
@WebServlet("/Check_Out")
public class Check_Out extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check_Out() {
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
	   String address=request.getParameter("add");
	   HttpSession session=request.getSession();
		String user=(String)session.getAttribute("uid");
		MyDao obj=new MyDao();
		
		if(user==null)
		{
			response.sendRedirect("customerLogin.jsp");
		}
		else {
		int total=obj.gTotal(user);
       
	   ArrayList<cartBean> list=obj.checkOut(user,address,total);
         
         RequestDispatcher rd=request.getRequestDispatcher("viewCheckOut.jsp");
          //request.setAttribute("LIST", list);
  	      rd.forward(request,response);
		}
        
       
       }

}
