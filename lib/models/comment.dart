import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String username;
  String comment;
  final  datePublished;
  String profilePhoto;
  List likes;
  String uid;
  String id;

  Comment({
    required this.datePublished,
    required this.username,
    required this.comment,
    required this.likes,
    required this.uid,
    required this.id,
    required this.profilePhoto,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'datePublished': datePublished,
        'comment': comment,
        'likes': likes,
        'uid': uid,
        'id': id,
        'profilePhoto': profilePhoto,
      };

  static Comment fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data()! as Map<String, dynamic>;
    return Comment(
      datePublished: snapshot['datePublished'],
      username: snapshot['username'],
      comment: snapshot['comment'],
      likes: snapshot['likes'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      profilePhoto: snapshot['profilePhoto'],
    );
  }
}
