package domain;

import java.util.Objects;

public class Post {
    private String id;

    public Post(String id){
        setId(id);
    }

    public String getId() {
        return id;
    }

    private void setId(String id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Post post = (Post) o;
        return Objects.equals(id, post.id);
    }

    @Override
    public String toString() {
        return "Post{" + "id='" + id + '\'' +
                '}';
    }
}
