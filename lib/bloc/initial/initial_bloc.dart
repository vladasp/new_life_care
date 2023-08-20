import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_life_care/bloc/initial/initial_event.dart';
import 'package:new_life_care/bloc/initial/initial_state.dart';
import 'package:new_life_care/repository/storage_repository.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc(super.initialState, this.repository) {
    on<NavigateToSelectDateEvent>(_navigateToSelectDateEventHandler);
  }

  final IStorageRepository repository;

  FutureOr<void> _navigateToSelectDateEventHandler(
    NavigateToSelectDateEvent event,
    Emitter<InitialState> emit,
  ) async {
    repository.saveCareType(event.type);
    emit(NavigateToSelectDateState());
  }
}
