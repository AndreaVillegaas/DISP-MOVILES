class Post {
  int userId;
  int id;
  String title;
  String body;

 Post(this.userId, this.id, this.title, this.body);
  
 Post.fromJson(Map<String, dynamic> json){
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}

class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment(this.postId, this.id, this.name, this.email, this.body);

  Comment.fromJson(Map<String, dynamic> json){
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }
}