import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tododemo/service_locator.iconfig.dart';

final locator = GetIt.instance;

void setupLocator() {
  _configure();
}

@injectableInit
void _configure({String environment}) => $initGetIt(locator, environment: environment);