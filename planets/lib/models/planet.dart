import 'package:cloud_firestore/cloud_firestore.dart';

class Planet{
   String id;
   String name;
   String location;
   String distance;
   String gravity;
   String description;
   String image;
   String picture;


  Planet.fromFB(DocumentSnapshot doc){
    id = doc.documentID;
    name = doc.data["name"];
    location = doc.data["location"];
    distance = doc.data["distance"];
    gravity = doc.data["gravity"];
    description = doc.data["description"];
    image = doc.data["image"];
    picture = doc.data["picture"];
  }
}