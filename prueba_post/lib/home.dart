import 'package:flutter/material.dart';
import 'post.dart';
import 'comments.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<Post> _post = List<Post>();

   Future<List<Post>> getPost() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);

    var posts = List<Post>();

    if (response.statusCode == 200) {
      var postsJson = json.decode(response.body);

      for (var postJson in postsJson) {
        posts.add(Post.fromJson(postJson));
      }
    }
    return posts;
  }


  @override
  void initState() {
    getPost().then((value) => setState(() {
          _post.addAll(value);
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        backgroundColor: Colors.purple
      ),
      body: ListView.builder(
        
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return Card(
            
            margin: EdgeInsets.all(5),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                     
                      Text(
                        _post[index].title,
                        style: TextStyle(
                          color: Colors.black,
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("\n${_post[index].body}",
                        style: TextStyle(color: Colors.black
                        ),
                      ),
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
                        IconButton(
                          color: Colors.deepPurple[100],
                          iconSize: 24,
                          splashColor: Colors.blue,
                          icon: Icon(Icons.comment),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Comments(
                                      post: _post[index],
                                    )));
                          },
                        ),
                        Text("5", style: TextStyle(
                          color: Colors.black,
                          fontSize: 20)),
                      ],
                    ),
                  ),
                  
                )
              ],
            ),
          );
        },
      ),
    );
  }
}



