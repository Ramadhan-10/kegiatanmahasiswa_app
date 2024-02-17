import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kegiatanmahasiswa_app/repository/login_repository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final LoginRepository repository;

  RegistrationBloc({required this.repository}) : super(RegistrationInitial()) {
    on<RegisterUser>(_onRegisterUser);
  }

  void _onRegisterUser(
      RegisterUser event, Emitter<RegistrationState> emit) async {
    try {
      emit(RegistrationLoading());

      final response = await repository.register(
        username: event.username,
        password: event.password,
        name: event.name,
        notlp: event.notlp,
      );

      emit(RegistrationSuccess(response));
    } catch (error) {
      emit(RegistrationFailure(error.toString()));
    }
  }
}
