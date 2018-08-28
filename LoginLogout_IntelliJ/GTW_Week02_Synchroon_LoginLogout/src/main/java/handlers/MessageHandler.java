package handlers;

import domain.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MessageHandler extends RequestHandler {
    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get current user
        Person user = getPersonIfAutheticated(request);
        //get recipient
        String other_id = request.getParameter("userid");
        Person other = getPersonService().getPerson(other_id);

        //get message and add it to the user and recipient
        String message = request.getParameter("message");
        getPersonService().sendMessage(user, other, message);
    }
}
