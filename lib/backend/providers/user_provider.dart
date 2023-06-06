import 'package:flew_travel/package/package.dart';
import 'package:flew_travel/backend/models/user.dart' as model;

class UserProvider with ChangeNotifier {
  model.User? _user;
  final AuthRepository _authRepository = AuthRepository();

  model.User get getUser => _user!;

  Future<void> refreshUser() async {
    model.User user = await _authRepository.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
