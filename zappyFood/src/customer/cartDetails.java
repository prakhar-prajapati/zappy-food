package customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.productBean;
import dao.MyDao;

/**
 * Servlet implementation class cartDetails
 */
@WebServlet("/cartDetails")
public class cartDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartDetails() {
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
		String quantity=request.getParameter("quantity");
		String id=request.getParameter("pid");
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("uid");
        
		if(user==null)
		{
			user=request.getRemoteAddr();
			productBean e=new productBean();
			e.setQuantity(quantity);
	         e.setId(Integer.parseInt(id));
	         e.setName(user);
	         System.out.println(user);
	    MyDao obj=new MyDao();
	    int x=obj.insertcart(e);
	    
	    if(x==1)
	    {
	    	RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	    	request.setAttribute("msg","<h3>Product added to cart..</h3>");	
	    	rd.forward(request, response);	
	    	//out.println("<h2>Added to cart...</h2>");
             	    
	    }
	    else {
	    	
	    	out.println("<h2> not Added to cart...</h2>");
	    }
	    
		}
		else if(user!=null)
	    {
	    	productBean e=new productBean();
			e.setQuantity(quantity);
			e.setId(Integer.parseInt(id));
	         e.setName(user);
	    MyDao obj=new MyDao();
	    int x=obj.insertcart(e);
	    if(x==1)
	    {
	    	//out.println("<h2>Add to cart...</h2>");
            //response.sendRedirect("customerHome.jsp");	    
	    	RequestDispatcher rd=request.getRequestDispatcher("customerHome.jsp");
	    	request.setAttribute("msg","<h3>Product added to cart..</h3>");	
	    	rd.forward(request, response);	
	    	   
	    }
	    else {
	    	out.println("<h2> not Added to cart...</h2>");
	    }
	    
		}
	    
		
	      
	}
}


