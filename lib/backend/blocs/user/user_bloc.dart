// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:flew_travel/package/package.dart';
import 'package:flew_travel/backend/models/user.dart' as model;
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  AuthRepository _authRepository = AuthRepository();
  UserBloc() : super(UserState()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> refreshUserDetail() async {
    model.User _user = await _authRepository.refreshUser();
    emit(state.copyWith(user: _user));
  }
}
