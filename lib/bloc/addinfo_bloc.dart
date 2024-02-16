import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:kegiatanmahasiswa_app/repository/info_repository.dart';

part 'addinfo_event.dart';
part 'addinfo_state.dart';

class AddinfoBloc extends Bloc<AddinfoEvent, AddinfoState> {
  final InfoRepository infoRepository;
  AddinfoBloc({required this.infoRepository}) : super(AddinfoInitialState()) {
    on<AddinfoInitialEvent>(_addinfoinitial);
    on<ClickTombolAddEvent>(_addInfoclick);
  }

  _addinfoinitial(AddinfoInitialEvent event, Emitter emit) async {
    emit(AddinfoLoadingState());
    emit(AddinfoInitialState());
  }

  _addInfoclick(ClickTombolAddEvent event, Emitter emit) async {
    final String judul = event.title;
    final String deskripsi = event.content;
    final String tanggal = event.date;
    final File gambar = event.image;
    emit(AddinfoLoadingState());

    try {
      final result = await infoRepository.addInfo(
          title: judul, content: deskripsi, date: tanggal, image: gambar);

      emit(AddinfoSuccessState(message: result));
      await Future.delayed(Duration(seconds: 3));
      emit(AddinfoInitialState());
    } catch (error) {
      emit(AddinfoErrorState(error: "Error $error"));
    }
  }
}
