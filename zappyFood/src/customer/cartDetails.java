package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
		}
		productBean e=new productBean();
		e.setQuantity(quantity);
         e.setId(Integer.parseInt(id));
         e.setName(user);
         System.out.println(user);
         MyDao m=new MyDao();
          
         
         int x=m.insertcart(e);
    
	    if(x==1)
	    {
	    	
	    	 ArrayList<productBean> list1= m.viewProductreadytodrink();
		      
		      ArrayList<productBean> list2= m.viewProductreadytoeat();
		      
		      ArrayList<productBean> list3= m.viewProductreadytocook();
		      
		      RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
		        request.setAttribute("LIST1", list1);
		      request.setAttribute("LIST2", list2);
		      request.setAttribute("LIST3", list3);
	    	
	    	request.setAttribute("msg","<h3>Product added to cart..</h3>");	
	    	rd.forward(request, response);	
	    	//out.println("<h2>Added to cart...</h2>");
             	    
	    }
	    else {
	    	
	    	out.println("<h2> not Added to cart...</h2>");
	    }
	    
		}
		
	    

	    
		
	      
	}


