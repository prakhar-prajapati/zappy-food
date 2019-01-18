package admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.orderBean;
import dao.MyDao;

/**
 * Servlet implementation class order_servlet
 */
@WebServlet("/order_servlet")
public class order_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public order_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyDao m=new MyDao();
	    
		
		int oid =Integer.parseInt(request.getParameter("oid"));
	      int action=Integer.parseInt(request.getParameter("action"));
	    String name=request.getParameter("user");
	    String email=m.sendEmail(name);
	     System.out.println("dispatch call"+email);
    
	  if(action==1)
	  {
		  int x=m.productDispatch(oid);
		    if(x!=0)
		    {
		 	      ArrayList<orderBean> list= m.ShowOrder();
		       RequestDispatcher rd=request.getRequestDispatcher("Admin_View_Order.jsp");
		 	      request.setAttribute("List", list);
				    request.setAttribute("msg", "Dispatch Successfully..");
		 	    String to=email;
				 String sub="Thanks for Shopping";
				 String msgs="Welcome to zappy food ,ur order id is "+oid+" and your order has been dispatched";
				 sendMail(to,sub,msgs);
			     System.out.println("Sent message successfully....");
			     rd.forward(request, response);
				 	
		    }		
       }
	     
	  if(action==2) {   
		  System.out.println("not availabe call");
		  int x=m.product_Notavailable(oid);
    if(x!=0)
    {
 	      ArrayList<orderBean> list= m.ShowOrder();
 	   RequestDispatcher rd=request.getRequestDispatcher("Admin_View_Order.jsp");
 	      request.setAttribute("List", list);
		    request.setAttribute("msg","product Not Available");
 	  String to=email;
		 String sub="Thanks for Shopping";
		 String msgs="Welcome to zappy food ,Your order is not available , sorry for inconvienece ,we inform You sortly if product come in stock";
		 sendMail(to,sub,msgs);
	     System.out.println("Sent message successfully....");
	     rd.forward(request, response);
	 	  
    }		
	  }
	  }
	  public void sendMail(String to,String sub,String msgs)
		{
		
			String from = "project.chayan@gmail.com";
		    final String username =  "project.chayan@gmail.com";//change accordingly
		    final String password = "Chayan1234";//change accordingly

		    // Assuming you are sending email through relay.jangosmtp.net
		    String host = "smtp.gmail.com";

		    Properties props = new Properties();
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.host", host);
		    props.put("mail.smtp.port", "587");

		    // Get the Session object.
		    Session session = Session.getInstance(props,
		    new javax.mail.Authenticator() {
		       protected PasswordAuthentication getPasswordAuthentication() {
		          return new PasswordAuthentication(username, password);
		       }
		    });

		    try {
		       // Create a default MimeMessage object.
		       Message message = new MimeMessage(session);

		       // Set From: header field of the header.
		       message.setFrom(new InternetAddress(from));

		       // Set To: header field of the header.
		       message.setRecipients(Message.RecipientType.TO,
		       InternetAddress.parse(to));

		       // Set Subject: header field
		       message.setSubject(sub);

		       // Now set the actual message
		       message.setText(msgs);

		       // Send message
		       
		       Transport.send(message);
		       } catch (Exception e) {
		  	  e.printStackTrace();
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
