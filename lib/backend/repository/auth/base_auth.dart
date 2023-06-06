// ignore_for_file: unused_fiel
import 'package:flew_travel/package/package.dart';
import 'package:flew_travel/backend/models/user.dart' as model;

abstract class BaseAuthRepository {
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String fullname,
    required String bio,
    required Uint8List file,
  });

  Future<String> loginUser({
    required String email,
    required String password,
  });

  Future<model.User> refreshUser();
}
