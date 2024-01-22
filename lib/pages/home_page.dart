import 'package:flutter/material.dart';
import 'package:flutter_application_stepik/bloc/user_bloc.dart';
import 'package:flutter_application_stepik/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: userRepository),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("List of the users"),
          centerTitle: true,
          backgroundColor: Colors.green.shade400,
        ),
        body: const SafeArea(
          child: Column(children: [
            ActionsButtons(),
            SizedBox(height: 20),
            Expanded(child: UserList()),
          ]),
        ),
        backgroundColor: Colors.blue.shade50,
      ),
    );
  }
}
