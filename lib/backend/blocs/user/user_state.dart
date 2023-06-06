// ignore_for_file: must_be_immutable

part of 'user_bloc.dart';

class UserState extends Equatable {
  model.User? user;
  UserState({
    this.user,
  });

  model.User? get getUser => user;

  UserState copyWith({
    model.User? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'UserState(user: $user)';

  @override
  List<Object?> get props => [user];
}
