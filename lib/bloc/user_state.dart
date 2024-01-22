import '../model/user.dart';

abstract class UserState {}

class UserEmptystate extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<User> loadedUser;
  UserLoadedState({required this.loadedUser});
}

class UsereErorState extends UserState {}
