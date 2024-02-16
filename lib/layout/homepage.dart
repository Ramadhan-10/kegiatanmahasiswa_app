import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

import 'login.dart';
import 'loading.dart';
import 'dashboard.dart';
import 'error_message.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginInitial) {
        return const LoginForm();
      } else if (state is LoginLoading) {
        return const LoadingIndicator();
      } else if (state is LoginSuccess) {
        return WelcomeScreen(
          sessionToken: state.sessionToken,
          name: state.nama,
        );
      } else if (state is LoginFailure) {
        return LoginForm();
      } else {
        return Container();
      }
    });
  }
}
