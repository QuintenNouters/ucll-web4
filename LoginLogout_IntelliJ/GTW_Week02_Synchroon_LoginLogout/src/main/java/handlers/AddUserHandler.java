package handlers;

import domain.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddUserHandler extends RequestHandler {
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Person person = (Person) request.getSession().getAttribute("user");
        Person friend = getPersonService().getPerson(id);
        if (friend != null){
            getPersonService().addFriend(person, friend);
        }
    }
}
