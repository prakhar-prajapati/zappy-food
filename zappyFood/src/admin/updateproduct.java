package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.productBean;
import dao.MyDao;

/**
 * Servlet implementation class updateproduct
 */
@WebServlet("/updateproduct")
public class updateproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateproduct() {
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
		String id=request.getParameter("pid");
		String category=request.getParameter("pcategory");
		String name=request.getParameter("pname");
		String description=request.getParameter("pdecs");
		String price= request.getParameter("pprice");
		
		String iid=request.getParameter("pid");
		String image=request.getParameter("pimage");
		
		productBean e=new productBean();
		e.setId(Integer.parseInt(id));
		e.setName(name);

		e.setDescription(description);
		e.setCategory(category);
		e.setPrice(Double.parseDouble(price));
		e.setImage(image);
        e.setId(Integer.parseInt(iid));		 
		//function call
		    MyDao m=new MyDao();
			int x= m.updateData(e);
	         if(x==1)
	         {    System.out.println("product call");
	        	 RequestDispatcher rd=request.getRequestDispatcher("ViewProduct");
	        	 ArrayList<productBean> list= m.ShowData();
			     request.setAttribute("LIST", list);
	        	 request.setAttribute("msg", "Data Updated Successfully...");
               rd.forward(request, response);
               
	         }// 
	         else {
	        	 out.println("<h1> failed update</h1>");
	         }
			
	}

	}


