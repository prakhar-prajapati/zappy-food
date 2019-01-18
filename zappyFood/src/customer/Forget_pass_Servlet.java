package customer;

import java.io.IOException;
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

import dao.MyDao;

/**
 * Servlet implementation class Forget_pass_Servlet
 */
@WebServlet("/Forget_pass_Servlet")
public class Forget_pass_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forget_pass_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyDao m=new MyDao();
		String name=request.getParameter("cname");
        String email=m.sendEmail(name);
        String password=m.sendPasswprd(name);
        
	    if(email!=null)
	    { 
	    	 RequestDispatcher rd=request.getRequestDispatcher("Forget_password.jsp");
	 	      //request.setAttribute("List", list);
			    request.setAttribute("msg", "<h3>check email address</h3>");
	 	    
	 	    String to=email;
				 String sub="Your password";
				 String msgs="Welcome to zappy food ,Your password is= <strong>"+password+"'</strong> <br> dont share with any one.";
				 sendMail(to,sub,msgs);
	           rd.forward(request, response);
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
	       message.setContent(msgs,"text/html");

	       // Send message
	       
	       Transport.send(message);
	       } catch (Exception e) {
	  	  e.printStackTrace();
	  	     }		
	}
}
