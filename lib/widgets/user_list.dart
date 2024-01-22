import 'package:flutter/material.dart';
import 'package:flutter_application_stepik/bloc/user_bloc.dart';
import 'package:flutter_application_stepik/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is UserLoadedState) {
        return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
                  color: index % 2 == 0 ? Colors.white : Colors.green.shade100,
                  child: ListTile(
                    leading: Text('ID: ${state.loadedUser[index].id}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    title: Column(children: [
                      Text(
                        'Name: ${state.loadedUser[index].name}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            "Email: ${state.loadedUser[index].email}",
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Phone: ${state.loadedUser[index].phone}'",
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ));
      }
      return SizedBox.square(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Icon(
            Icons.sentiment_satisfied_alt_rounded,
            color: Colors.amber.shade400,
            size: 100,
          ),
        ),
      );
    });
  }
}
