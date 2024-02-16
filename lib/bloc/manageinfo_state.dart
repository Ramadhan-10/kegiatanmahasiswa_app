part of 'manageinfo_bloc.dart';

@immutable
sealed class ManageinfoState extends Equatable {}

final class ManageinfoInitial extends ManageinfoState {
  final List info;
  final String searchText;

  ManageinfoInitial({required this.info, this.searchText = ""});

  @override
  List<Object> get props => [info, searchText];
}

final class LoadingManageInfo extends ManageinfoState {
  @override
  List<Object> get props => [];
}
