import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flew_travel/backend/models/user.dart' as model;
import 'package:flew_travel/backend/repository/user/base_user.dart';

class UserRepository implements BaseUserReposity {
  FirebaseFirestore _database = FirebaseFirestore.instance;
  @override
  Future<void> upToDatabase({
    required String username,
    required String uid,
    required String email,
    required String fullname,
    required String bio,
    required String photoUrl,
  }) async {
    model.User user = model.User(
      uid: uid,
      username: username,
      email: email,
      fullname: fullname,
      bio: bio,
      photoUrl: photoUrl,
      followers: [],
      following: [],
    );
    _database.collection('users').doc(uid).set(
          user.toJson(),
        );
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _database.collection('users').doc(uid).get();
      List following = (snap.data() as dynamic)['following'];
      if (following.contains(followId)) {
        await _database.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });
        await _database.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _database.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });
        await _database.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
