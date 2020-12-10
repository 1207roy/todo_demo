import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:tododemo/common/mobx_provider.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/service_locator.dart';
import 'package:tododemo/services/services.dart';
import 'package:tododemo/services/todo_repository.dart';

part 'to_do_store.g.dart';

class ToDoStore = _ToDoStoreBase with _$ToDoStore;

abstract class _ToDoStoreBase with Store, Disposable {
  _ToDoStoreBase({final ToDoRepository toDoRepository, final LocalNotificationManager localNotificationManager})
      : _toDoRepository = toDoRepository ?? locator<ToDoRepository>(),
        _localNotificationManager = localNotificationManager ?? locator<LocalNotificationManager>() {
    _fetchToDoList();
  }

  final ToDoRepository _toDoRepository;
  final LocalNotificationManager _localNotificationManager;

  Timer timer;

  @observable
  Result<bool> _toDoResult = Result.none();

  Result<bool> get toDoResult => _toDoResult;

  @observable
  List<ToDo> _toDoList;

  List<ToDo> get toDoList => _toDoList;

  @action
  Future<void> _fetchToDoList() async {
    if (_toDoResult == Result.loading()) {
      return;
    }

    _toDoResult = Result.loading();
    try {
      _toDoList = await _toDoRepository.toDos;

      if (_toDoList != null) {
        _toDoResult = Result(true);
      }
    } catch (e, stackTrace) {
      _toDoResult = Result.error(error: e, message: e.toString());
    }
  }

  @action
  Future<void> createToDo(String title, String body, Reminder reminder) async {
    _toDoResult == Result.loading();
    final toDo = ToDo(id: _generateRandomNumber(), title: title, body: body, reminder: reminder);
    print('createToDo: id: toDo: ${toDo.id}');
    await _toDoRepository.updateToDo(toDo);
    _toDoList.add(toDo);
    if (toDo.reminder != null) {
      setReminder(toDo);
    }
    _toDoResult = Result(true);
  }

  @action
  Future<void> updateToDo(ToDo toDo, bool isReminderUpdated) async {
    print('updateToDo: id: toDo: ${toDo.id}');

    _toDoResult == Result.loading();
    await _toDoRepository.updateToDo(toDo);
    if (isReminderUpdated) {
      setReminder(toDo);
    }
    _toDoResult = Result(true);
  }

  @action
  Future<void> deleteToDo(ToDo toDo) async {
    print('deleteToDo: id: toDo: ${toDo.id}');
    _toDoResult == Result.loading();
    await _toDoRepository.deleteToDo(toDo);
    _toDoList.remove(toDo);
    _toDoResult = Result(true);
  }

  @action
  Future<void> setReminder(ToDo toDo) async {
    if (toDo.reminder == null) {
      print('setReminder: id: ${toDo.id}');
      await _cancelNotification(toDo.id);
    } else {
      toDo.reminder.isDailyNotification
          ? await _scheduleDailyReminderNotification(toDo)
          : await _scheduleReminderNotification(toDo);
    }
  }

  Future<void> _scheduleDailyReminderNotification(ToDo toDo) async {
    await _cancelNotification(toDo.id);
    await _localNotificationManager.scheduleDailyReminderNotification(
        toDo.id, toDo.reminder.scheduledTime, 'Hey check the daily notification...', null);
  }

  Future<void> _scheduleReminderNotification(ToDo toDo) async {
    await _cancelNotification(toDo.id);
    await _localNotificationManager.scheduleReminderNotification(
        toDo.id, toDo.reminder.dateTime, 'Hey check the daily notification...', null);
  }

  Future<void> _cancelNotification(int id) async {
    return await _localNotificationManager.cancelNotification(id);
  }

  int _generateRandomNumber() {
    var random = Random();
    final maxChannelId = pow(2, 31) - 1;
//    final minChannelId = -pow(2, 31);
    var n1 = random.nextInt(maxChannelId);
    var n2 = random.nextInt(maxChannelId - 1);
    if (n2 >= n1) n2 += 1;
    return n2;
  }
}
