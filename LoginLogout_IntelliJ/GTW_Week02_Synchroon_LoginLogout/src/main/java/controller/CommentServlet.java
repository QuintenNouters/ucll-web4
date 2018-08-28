package controller;

import db.CommentRepository;
import db.CommentRepositoryStub;
import domain.Comment;
import domain.DomainException;
import org.json.JSONObject;


import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/echo")
public class CommentServlet {
    private static final Set<Session> sessions;
    private CommentRepository comments = new CommentRepositoryStub();

    static {
        sessions = Collections.synchronizedSet(new HashSet<Session>());
    }

    @OnOpen
    public void onOpen(Session session) {
        sessions.add(session);
    }

    private void sendMessageToAll(String message){
        try {
            JSONObject obj =new JSONObject(message);
            String postid = obj.getString("postid");
            String name = obj.getString("name");
            String text = obj.getString("text");
            String rating = obj.getString("rating");
            Comment c = new Comment(name, text, rating);

            for (Session s: sessions) {
                try {
                    s.getBasicRemote().sendText(message);
                } catch (IOException ex){
                    ex.printStackTrace();
                }
            }

        } catch (DomainException e){
            e.printStackTrace();
        }

    }

    @OnMessage
    public void onMessage(String message, Session session){
        sendMessageToAll(message);
    }

    @OnClose
    public void onClose(Session session){
        sessions.remove(session);
    }

    @OnError
    public void onError(Throwable error){

    }
}