import 'package:flutter_application_stepik/model/user.dart';
import 'package:flutter_application_stepik/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
