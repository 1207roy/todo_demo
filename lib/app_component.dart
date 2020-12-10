
import 'package:tododemo/service_locator.dart';
import 'package:tododemo/services/app_component_interface.dart';
import 'package:tododemo/services/services.dart';
import 'package:tododemo/services/todo_repository.dart';

class AppComponent implements AppComponentBase {

  AppComponent() {
    setupLocator();
  }

  @override
  SettingRepository getSettingRepository() => locator<SettingRepository>();

  @override
  InstantLocalPersistenceService getInstantLocalPersistenceService() => locator<InstantLocalPersistenceService>();

  @override
  ToDoRepository getTodoRepository() => locator<ToDoRepository>();
}
