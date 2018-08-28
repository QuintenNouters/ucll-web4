package handlers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import domain.PersonService;
import domain.Person;
import domain.Role;
import util.Jsoniser;

import java.io.IOException;

public abstract class RequestHandler {
	
	private PersonService personService;
	
	public abstract void handleRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public void setModel (PersonService personService) {
		this.personService = personService;
	}

	public PersonService getPersonService() {
		return personService;
	}
	
	protected boolean isFromUserWithRole (HttpServletRequest request, Role role) {
		Person person = (Person) request.getSession().getAttribute("user");
		if (person != null && person.getRole().equals(role)) {
			return true;
		}
		return false;
	}

	protected Person getPersonIfAutheticated(HttpServletRequest request) {
		return request.getSession().getAttribute("user") != null ? (Person)request.getSession().getAttribute("user"): null;
	}

	public static void sendObjectAsJson(HttpServletResponse response, Object o){
		try {
			response.setContentType("application/json");
			sendJSON(response, Jsoniser.toJSON(o));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}

	public static void sendJSON(HttpServletResponse response, String json){
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

