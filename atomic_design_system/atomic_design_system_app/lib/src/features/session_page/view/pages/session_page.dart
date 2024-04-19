import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/data.dart';
import '../../domain/entities/session.dart';
import '../bloc_cubit/session_cubit.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionCubit = context.read<SessionCubit>();
    return Scaffold(
      body: BlocBuilder<SessionCubit, SessionState>(builder: (_, state) {
        switch (state.runtimeType) {
          // ignore: type_literal_in_constant_pattern
          case Initial:
            return const Center(child: Text('No hay sesión'));
          // ignore: type_literal_in_constant_pattern
          case Loaded:
            state as Loaded;
            return ListView(children: [
              Text('success: ${state.session.success}'),
              Text('message: ${state.session.message}'),
              Text('data: ${state.session.data}'),
            ]);
          default:
            throw Exception();
        }
      }),
      floatingActionButton: FloatingActionButton.small(onPressed: () {
        const Session tSession = Session(
          success: true,
          message: 'test text',
          data: Data(data: {}),
        );
        sessionCubit.getSession();
      }),
    );
  }
}
