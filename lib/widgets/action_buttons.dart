import 'package:flutter/material.dart';
import 'package:flutter_application_stepik/bloc/user_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';

class ActionsButtons extends StatelessWidget {
  const ActionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      ElevatedButton(
        onPressed: () {
          userBloc.add(UserLoadEvent());
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text('Load'),
      ),
      ElevatedButton(
        onPressed: () {
          userBloc.add(UserClearEvent());
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text('Clear'),
      ),
    ]);
  }
}
