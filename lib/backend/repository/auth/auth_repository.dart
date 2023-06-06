// ignore_for_file: unused_field
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flew_travel/package/package.dart';
import 'package:flew_travel/backend/models/user.dart' as model;

class AuthRepository implements BaseAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepository = new UserRepository();
  final StorageRepository _storageRepository = new StorageRepository();
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _database.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please fill all fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String fullname,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          fullname.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(_auth.currentUser!.uid);
        //Upload your avatar to Database
        String photoUrl = await _storageRepository.uploadImageToStorage(
            'avatarProfile', file, false);

        //Add User To Database (FireStore), You can split that method to class
        await _userRepository.upToDatabase(
          username: username,
          email: email,
          uid: cred.user!.uid,
          fullname: fullname,
          bio: bio,
          photoUrl: photoUrl,
        );
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      res = err.toString();
      switch (err.code) {
        case "invalid-email":
          res = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          res = "Your email or password is wrong.";
          break;
        case "weak-password":
          res = "Your password should be at least 6 characters.";
          break;
        case "email-already-in-use":
          res = "The email address is already in use by another account.";
          break;
        default:
          res = "An error occured. Please try again later.";
      }
    }
    return res;
  }

  @override
  Future<model.User> refreshUser() async {
    model.User user = await getUserDetails();
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
