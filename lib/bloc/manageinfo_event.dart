part of 'manageinfo_bloc.dart';

@immutable
sealed class ManageinfoEvent extends Equatable {}

final class LoadListInfoEvent extends ManageinfoEvent {
  final String keyword;

  LoadListInfoEvent({this.keyword = ""});

  List<Object?> get props => [];
}
