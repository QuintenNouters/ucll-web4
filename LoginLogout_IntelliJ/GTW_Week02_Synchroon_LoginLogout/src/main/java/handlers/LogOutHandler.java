package handlers;

import domain.Person;
import handlers.RequestHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogOutHandler extends RequestHandler {

	@Override
	public void handleRequest(HttpServletRequest request,
							  HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try{
			Person p = (Person) request.getSession().getAttribute("user");
		}catch (ClassCastException e){
			e.printStackTrace();
		}
		session.invalidate();
		response.sendRedirect("Controller");
		//return "index.jsp";
	}
	
}
