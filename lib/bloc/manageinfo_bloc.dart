import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:kegiatanmahasiswa_app/repository/info_repository.dart';

part 'manageinfo_event.dart';
part 'manageinfo_state.dart';

class ManageinfoBloc extends Bloc<ManageinfoEvent, ManageinfoState> {
  InfoRepository infoRepository;

  ManageinfoBloc({required this.infoRepository}) : super(LoadingManageInfo()) {
    on<LoadListInfoEvent>((_listinfo));
  }

  _listinfo(LoadListInfoEvent event, Emitter emit) async {
    String key = event.keyword;

    emit(LoadingManageInfo());
    List res = await infoRepository.getInfoList(key);
    emit(ManageinfoInitial(info: res, searchText: key));
  }
}
