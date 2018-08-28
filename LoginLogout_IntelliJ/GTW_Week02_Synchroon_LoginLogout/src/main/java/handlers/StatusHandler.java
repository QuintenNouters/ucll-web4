package handlers;

import domain.Person;
import domain.Status;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StatusHandler extends RequestHandler {

    public void handleRequest(HttpServletRequest request, HttpServletResponse response) {
        Person p = (Person) request.getSession().getAttribute("user");
        String status = request.getParameter("status");
        String message = request.getParameter("message");

        if(status != null && status != "" && p != null){
            p.setStatus(Status.valueOf(status));
            if(message != null && message != ""){
                p.setMessage(message);
            }
        }
        RequestHandler.sendObjectAsJson(response, p);
//        String destination = "friendsoverview.jsp";
//        return destination;
    }
}
