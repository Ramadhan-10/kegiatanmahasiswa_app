part of 'addinfo_bloc.dart';

@immutable
sealed class AddinfoState {}

class AddinfoInitialState extends AddinfoState {}

class AddinfoLoadingState extends AddinfoState {}

class AddinfoSuccessState extends AddinfoState {
  final String message;
  AddinfoSuccessState({required this.message});
}

class AddinfoErrorState extends AddinfoState {
  final String error;
  AddinfoErrorState({required this.error});
}
