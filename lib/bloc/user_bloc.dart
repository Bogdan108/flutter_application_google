import 'package:flutter_application_stepik/bloc/user_event.dart';
import 'package:flutter_application_stepik/bloc/user_state.dart';
import 'package:flutter_application_stepik/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserEmptystate()) {
    on<UserLoadEvent>(((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<User> loadedUserList = await userRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: loadedUserList));
      } catch (_) {
        emit(UsereErorState());
      }
    }));
    on<UserClearEvent>(
      (event, emit) async {
        emit(UserEmptystate());
      },
    );
  }
}
