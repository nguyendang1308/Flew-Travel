import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String username;
  final String fullname;
  final String email;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  const User({
    required this.uid,
    required this.username,
    required this.fullname,
    required this.email,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  @override
  List<Object?> get props {
    return [
      uid,
      username,
      fullname,
      email,
      followers,
      following,
    ];
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
        'fullname': fullname,
        'bio': bio,
        'photoUrl': photoUrl,
        'followers': [],
        'following': [],
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot['username'],
      fullname: snapshot['fullname'],
      email: snapshot['email'],
      bio: snapshot['bio'],
      photoUrl: snapshot['photoUrl'],
      followers: snapshot['followers'],
      following: snapshot['following'],
      uid: snapshot['uid'],
    );
  }

  @override
  String toString() {
    return 'User(username: $username, fullname: $fullname, email: $email, followers: $followers, following: $following)';
  }
}
