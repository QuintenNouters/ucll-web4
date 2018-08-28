package handlers;

import domain.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

public class SearchUsersHandler extends RequestHandler {
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("key");
        Set<Person> searchResult = getPersonService().search(search);
        searchResult.remove(getPersonIfAutheticated(request));
        searchResult.removeAll(getPersonService().getFriends(getPersonIfAutheticated(request)));
        RequestHandler.sendObjectAsJson(response,searchResult);
    }
}
