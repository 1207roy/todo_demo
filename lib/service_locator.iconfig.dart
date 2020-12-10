// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:tododemo/services/sharedpref_service.dart';
import 'package:tododemo/services/instant_local_persistence_service.dart';
import 'package:tododemo/services/repositories/setting_repository_impl.dart';
import 'package:tododemo/services/setting_repository.dart';
import 'package:tododemo/services/repositories/todo_repository_impl.dart';
import 'package:tododemo/services/todo_repository.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<InstantLocalPersistenceService>(
      () => SharedPrefService());
  g.registerLazySingleton<SettingRepository>(
      () => SettingRepositoryImpl(g<InstantLocalPersistenceService>()));
  g.registerLazySingleton<ToDoRepository>(() => ToDoRepositoryImpl());
}
