part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class RegisterUser extends RegistrationEvent {
  final String username;
  final String password;
  final String name;
  final String notlp;

  RegisterUser({
    required this.username,
    required this.password,
    required this.name,
    required this.notlp,
  });

  @override
  List<Object> get props => [username, password, name, notlp];
}
