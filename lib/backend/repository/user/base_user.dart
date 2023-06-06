abstract class BaseUserReposity {
  Future<void> upToDatabase({
    required String username,
    required String uid,
    required String email,
    required String fullname,
    required String bio,
    required String photoUrl,
  });
}
