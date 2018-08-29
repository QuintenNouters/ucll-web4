package handlers;

import db.DbException;
import domain.Person;
import domain.Status;
import domain.Role;
import util.Hashing;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SignUpHandler extends RequestHandler {
    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //WEB 3
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        String repPassword = request.getParameter("reppassword");
        String age = request.getParameter("age");
        Person p = new Person();

        List<String> errors = new ArrayList<String>();
        this.setEmail(errors, p, email);
        this.setFirstName(errors, p, firstName);
        this.setLastName(errors, p, lastName);
        this.setPassword(errors, p, password, repPassword);
        this.setAge(errors,p,age);
        this.setGender(errors,p,gender);
        p.setRole(Role.LID);
        p.setStatus(Status.ONLINE);

        try{
            if(errors.isEmpty()){
                getPersonService().addPerson(p);
            }
        }catch(DbException e){
            errors.add(e.getMessage());
            e.printStackTrace();
        }

        if(errors.isEmpty()){
            response.sendRedirect("Controller?action=HomePage");
        }else{
            request.setAttribute("errors", errors);
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("email", email);
            request.setAttribute("age", age);
            request.getRequestDispatcher("signUp.jsp").forward(request, response);
        }
    }

    private void setPassword(List<String> errors, Person p, String password, String reppassword) {
        try{
            if(password.equals(reppassword)){
                p.setPassword(password);
            }else {
                errors.add("your password doesnt match repeat password");
            }
        }catch(IllegalArgumentException e){
            errors.add(e.getMessage());
        }
    }

    private void setLastName(List<String> errors, Person p, String lastName) {
        try{
            p.setLastName(lastName);
        }catch(IllegalArgumentException e){
            errors.add(e.getMessage());
        }
    }

    private void setFirstName(List<String> errors, Person p, String firstName) {

        try{
            p.setFirstName(firstName);
        }catch(IllegalArgumentException e){
            errors.add(e.getMessage());
        }
    }

    private void setEmail(List<String> errors, Person p, String email) {
        try{
            p.setUserId(Hashing.SHA256(email, "").substring(0,8));
            p.setUserId(email);
        }catch(IllegalArgumentException e){
            errors.add(e.getMessage());
        }
    }

    private void setGender(List<String> errors, Person p, String gender) {

        try{
            p.setGender(gender);
        }catch(IllegalArgumentException e){
            errors.add(e.getMessage());
        }
    }
    private void setAge(List<String> errors, Person p, String age) {

        try{
            int ageNum = Integer.parseInt(age);
            p.setAge(ageNum);
        }catch(IllegalArgumentException e){
            errors.add(e.getMessage());
        }
    }
}
