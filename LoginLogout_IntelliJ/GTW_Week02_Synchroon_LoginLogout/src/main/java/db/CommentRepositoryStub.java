package db;

import domain.Comment;
import domain.Post;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CommentRepositoryStub implements CommentRepository{

    private final Map<Post, List<Comment>> postMap;

    public CommentRepositoryStub() {
        postMap = new HashMap<Post, List<Comment>>();
        List<Comment> commentsList = new ArrayList<Comment>();
        commentsList.add(new Comment("myname", "test", 6));
        postMap.put(new Post("post1"), commentsList);
    }

    public void addComment(Post post, Comment comment) {
        if(!postMap.containsKey(post)){
            postMap.put(post, new ArrayList<Comment>());
        }
        postMap.get(post).add(comment);
    }


    public void removeComment(Post post, Comment comment) {
        if(!postMap.containsKey(post)){
            postMap.put(post, new ArrayList<Comment>());
        }
        postMap.get(post).remove(comment);
    }


    public Map<Post, List<Comment>> getPostMap() {
        return postMap;
    }


    public List<Post> getPosts() {
        return (List<Post>) postMap.keySet();
    }


    public List<Comment> getComments(Post post) {
        return postMap.containsKey(post) ? postMap.get(post):new ArrayList<Comment>();
    }

    @Override
    public Post getPostById(String postid) {
        return new Post(postid);
    }
}
