import 'package:flutter/material.dart';
import 'post.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;


class Comments extends StatefulWidget {
  final Post post;
  
  Comments({@required this.post}); 

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
 
  List<Comment> _comments = List<Comment>();

  Future<List<Comment>> getComments(int postId) async {
    var url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';
    var response = await http.get(url);

    var comments = List<Comment>();

    if (response.statusCode == 200) {
      var commentsJson = json.decode(response.body);

      for (var commentJson in commentsJson) {
        comments.add(Comment.fromJson(commentJson));
      }
    }
    return comments;
  }

  @override
  void initState() {
    
    super.initState();
    getComments(widget.post.id).then((value) => setState(() {
          _comments.addAll(value);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comments"),
          backgroundColor: Colors.pink[400], 
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                     IconButton(
                          color: Colors.orange,
                          iconSize: 45,
                          splashColor: Colors.blue,
                          icon: Icon(Icons.person),
                          onPressed: () {},),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, right: 20.0, left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            widget.post.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          /*Text(
                            "\n${widget.post.body}",
                            style: TextStyle(color: Colors.black),
                          ),*/
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            /*Text(
                              "0",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),*/
                            
                           /* Text(
                              "${_comments.length}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),*/
                           
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                   
                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height - 320,
                    child: ListView.builder(
                       
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                                title: Text(
                                  
                                  _comments[index].name,
                                  style: TextStyle(color: Colors.black),
                                
                                ),
                                
                                  subtitle: Text(
                                    "${_comments[index].email}\n\n${_comments[index].body}",
                                    style: TextStyle(color: Colors.black)),
                                isThreeLine: true,
                                dense: false,
                               ),
                               
                          );
                          
                        }),
                  ),
                  
                ],
              )
            ],
          ),
        ));
  }
}
