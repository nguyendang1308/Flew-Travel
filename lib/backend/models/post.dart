import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String postId;
  final String uid;
  final String description;
  final String datePublished;
  final String username;
  final String postUrl;
  final String profImage;
  final likes;

  const Post({
    required this.postId,
    required this.uid,
    required this.description,
    required this.datePublished,
    required this.username,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  @override
  List<Object> get props {
    return [
      postId,
      uid,
      description,
      datePublished,
      username,
      postUrl,
      profImage,
      likes
    ];
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'uid': uid,
        'username': username,
        'postId': postId,
        'datePublished': datePublished,
        'postUrl': postUrl,
        'profImage': profImage,
        'likes': likes
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      description: snapshot['description'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      postUrl: snapshot['postUrl'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
    );
  }

  @override
  String toString() {
    return 'User(postId: $postId, uid: $uid, description: $description, datePublished: $datePublished, username: $username, postUrl: $postUrl, profImage: $profImage)';
  }
}
