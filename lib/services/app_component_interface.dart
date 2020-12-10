
import 'package:tododemo/services/services.dart';
import 'package:tododemo/services/todo_repository.dart';

abstract class AppComponentBase {
  static AppComponentBase _component;

  factory AppComponentBase.build(AppComponentBase appComponent) {
    assert(appComponent != null);
    _component = appComponent;
    return _component;
  }

  static AppComponentBase getInstance() {
    if (_component == null) {
      throw Exception("AppComponent is not previously initialised. The \"build\" method should be called first");
    }
    return _component;
  }

  InstantLocalPersistenceService getInstantLocalPersistenceService() {
    if (_component != null) return _component.getInstantLocalPersistenceService();
    throw Exception("AppComponentBase.build method has not been called with proper appComponent argument");
  }

  SettingRepository getSettingRepository() {
    if (_component != null) return _component.getSettingRepository();
    throw Exception("AppComponentBase.build method has not been called with proper appComponent argument");
  }

  ToDoRepository getTodoRepository() {
    if (_component != null) return _component.getTodoRepository();
    throw Exception("AppComponentBase.build method has not been called with proper appComponent argument");
  }
}
