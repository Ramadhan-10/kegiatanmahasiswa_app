import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/addinfo_bloc.dart';
import 'addinfoform.dart';

class InfoForm extends StatelessWidget {
  const InfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddinfoBloc, AddinfoState>(
      builder: (context, state) {
        if (state is AddinfoInitialState) {
          return const AddInfoForm();
        } else if (state is AddinfoLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is AddinfoSuccessState) {
          return Text(state.message);
        } else if (state is AddinfoErrorState) {
          return Text('error: ${state.error}');
        } else {
          return Container();
        }
      },
    );
  }
}
