package handlers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FriendsOverviewHandler extends RequestHandler{
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        return "friendsoverview.jsp";
        request.getRequestDispatcher("friendsoverview.jsp").forward(request, response);
    }
}
