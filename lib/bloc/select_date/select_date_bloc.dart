import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_life_care/bloc/select_date/select_date_event.dart';
import 'package:new_life_care/bloc/select_date/select_date_state.dart';
import 'package:new_life_care/repository/storage_repository.dart';

class SelectDateBloc extends Bloc<SelectDateEvent, SelectDateState> {
  SelectDateBloc(super.initialState, this.repository) {
    on<NavigateToResultEvent>(_navigateToSelectDateEventHandler);
  }

  final IStorageRepository repository;

  FutureOr<void> _navigateToSelectDateEventHandler(
    NavigateToResultEvent event,
    Emitter<SelectDateState> emit,
  ) async {
    repository.saveBirthday(event.year);
    emit(NavigateToResultState());
  }
}
