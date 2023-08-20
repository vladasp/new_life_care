import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:new_life_care/repository/storage_repository.dart';
import 'package:new_life_care/utils/bloc_observable.dart';
import 'package:new_life_care/utils/extensions.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = const AppBlocObserver();
  final storage = StorageRepository();
  GetIt.I.registerSingleton<IStorageRepository>(StorageRepository());
  final initialRoute = (await storage.profile).initialRoute;
  runApp(App(initialRoute: initialRoute));
}
