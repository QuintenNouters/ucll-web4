package handlers;

import domain.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MessageListHandler extends RequestHandler {
    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get authenticated user
        Person user = getPersonIfAutheticated(request);
        //get the list of message of the authenticated user and send it as json
        sendObjectAsJson(response, getPersonService().getMessages(user));
    }
}
