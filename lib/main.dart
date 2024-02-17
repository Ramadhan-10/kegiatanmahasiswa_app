import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kegiatanmahasiswa_app/bloc/addinfo_bloc.dart';
import 'package:kegiatanmahasiswa_app/bloc/detail_bloc.dart';
import 'package:kegiatanmahasiswa_app/bloc/editinfo_bloc.dart';
import 'package:kegiatanmahasiswa_app/bloc/registration_bloc.dart';
import 'package:kegiatanmahasiswa_app/layout/registration_form.dart';
import 'package:kegiatanmahasiswa_app/repository/info_repository.dart';
import 'package:kegiatanmahasiswa_app/repository/login_repository.dart';
import 'package:kegiatanmahasiswa_app/bloc/manageinfo_bloc.dart';
import 'layout/homepage.dart';
import 'bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => LoginRepository(),
          ),
          RepositoryProvider(
            create: (context) => InfoRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  LoginBloc(loginRepository: context.read<LoginRepository>())
                    ..add(const InitLogin()),
            ),
            BlocProvider(
                create: (context) => RegistrationBloc(
                    repository: context.read<LoginRepository>())),
            BlocProvider(
                create: (context) =>
                    AddinfoBloc(infoRepository: context.read<InfoRepository>())
                      ..add(AddinfoInitialEvent())),
            BlocProvider(
                create: (context) => ManageinfoBloc(
                    infoRepository: context.read<InfoRepository>())
                  ..add(LoadListInfoEvent())),
            BlocProvider(
              create: (context) =>
                  DetailBloc(infoRepository: context.read<InfoRepository>()),
            ),
            BlocProvider(
                create: (context) => EditinfoBloc(
                    infoRepository: context.read<InfoRepository>()))
          ],
          child: const MaterialApp(
            title: "Home",
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}
