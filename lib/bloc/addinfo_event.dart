part of 'addinfo_bloc.dart';

@immutable
sealed class AddinfoEvent extends Equatable {
  const AddinfoEvent();
  @override
  List<Object> get props => [];
}

final class AddinfoInitialEvent extends AddinfoEvent {
  const AddinfoInitialEvent();
  @override
  List<Object> get props => [];
}

final class ClickTombolAddEvent extends AddinfoEvent {
  final String title;
  final String content;
  final String date;
  final File image;

  const ClickTombolAddEvent({
    required this.title,
    required this.content,
    required this.date,
    required this.image,
  });

  @override
  List<Object> get props => [title, content, date, image];
}
