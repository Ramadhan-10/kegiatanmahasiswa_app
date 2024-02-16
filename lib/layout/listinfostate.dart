import 'package:flutter/material.dart';
import 'package:kegiatanmahasiswa_app/bloc/manageinfo_bloc.dart';
import 'package:kegiatanmahasiswa_app/layout/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kegiatanmahasiswa_app/layout/listinfoview.dart';

class ListInfoState extends StatefulWidget {
  const ListInfoState({super.key});

  @override
  State<ListInfoState> createState() => _ListInfoStateState();
}

class _ListInfoStateState extends State<ListInfoState> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageinfoBloc, ManageinfoState>(
      builder: (context, state) {
        if (state is LoadingManageInfo) {
          return LoadingIndicator();
        } else if (state is ManageinfoInitial) {
          return ListInfoView(
            info: state.info,
            searchText: state.searchText,
          );
        } else {
          return Container(
            child: Text("error state"),
          );
        }
      },
    );
  }
}
