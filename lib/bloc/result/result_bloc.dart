import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_life_care/bloc/result/result_event.dart';
import 'package:new_life_care/bloc/result/result_state.dart';
import 'package:new_life_care/data/profile_model.dart';
import 'package:new_life_care/repository/storage_repository.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc(super.initialState, this.repository) {
    on<GetResultEvent>(_getResultEventHandler);
    on<NavigateBackEvent>(_navigateBackEventHandler);
  }

  final IStorageRepository repository;

  FutureOr<void> _navigateBackEventHandler(
    NavigateBackEvent event,
    Emitter<ResultState> emit,
  ) async {
    emit(NavigateBackState(state.model));
  }

  FutureOr<void> _getResultEventHandler(
    GetResultEvent event,
    Emitter<ResultState> emit,
  ) async {
    final model = await repository.profile;
    emit(InitState(model ?? ProfileModel.empty()));
  }
}
