part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String sessionToken;
  final String nama;

  LoginSuccess({required this.sessionToken, required this.nama});
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}
