package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.orderBean;
import dao.MyDao;

/**
 * Servlet implementation class Admin_View_Order_Servlet
 */
@WebServlet("/Admin_View_Order_Servlet")
public class Admin_View_Order_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_View_Order_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MyDao obj=new MyDao();
		        ArrayList<orderBean> list=obj.ShowOrder();
		        RequestDispatcher rd=request.getRequestDispatcher("Admin_View_Order.jsp");
		        request.setAttribute("List", list);
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
