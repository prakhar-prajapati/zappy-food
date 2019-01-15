package cart;

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
 * Servlet implementation class ChangeQuantity
 */
@WebServlet("/ChangeQuantity")
public class ChangeQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeQuantity() {
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
		String cid=request.getParameter("cid");
		String quantity=request.getParameter("q");
		
		MyDao obj=new MyDao();
		int x=obj.ChangeQuantity(cid,quantity);
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("uid");
        if(user==null)
		{
			user=request.getRemoteAddr();
		}
		
		int y=obj.gTotal(user);
		
		if(x==1)
		{
			System.out.println("Succes...");
		}else
			System.out.println("Succes failed...");
		
		out.println(y);
	
	}

}
