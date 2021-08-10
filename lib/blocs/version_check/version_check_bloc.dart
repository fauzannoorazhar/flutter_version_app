import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_version_app/models/version.dart';
import 'package:flutter_version_app/service/version_service.dart';

part 'version_check_event.dart';
part 'version_check_state.dart';

class VersionCheckBloc extends Bloc<VersionCheckEvent, VersionCheckState> {
  final VersionService _service;

  VersionCheckBloc(this._service) : super(VersionCheckState());

  @override
  Stream<VersionCheckState> mapEventToState(VersionCheckEvent event) async* {
    if (event is InitialLoadVersionEvent) {
      yield* _initialLoadVersionEvent();
    } else if (event is UpdateVersionEvent) {
      yield state.copyWith(version: event.version);
    }
  }

  Stream<VersionCheckState> _initialLoadVersionEvent() async* {
    try {
      _service.getVersion().listen((Version version) {
        add(UpdateVersionEvent(version: version));
      });
    } catch (e) {
      yield VersionFailureState(e.toString());
    }
  }
}
