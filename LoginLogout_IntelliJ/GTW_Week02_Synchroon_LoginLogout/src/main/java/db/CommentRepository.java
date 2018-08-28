package db;

import domain.Comment;
import domain.Post;

import java.util.List;
import java.util.Map;

public interface CommentRepository {
    void addComment(Post post, Comment comment);
    void removeComment(Post post, Comment comment);
    Map<Post, List<Comment>> getPostMap();
    List<Post> getPosts();
    List<Comment> getComments(Post post);
    Post getPostById(String postid);
}
