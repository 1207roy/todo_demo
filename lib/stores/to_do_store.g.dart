// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ToDoStore on _ToDoStoreBase, Store {
  final _$_toDoResultAtom = Atom(name: '_ToDoStoreBase._toDoResult');

  @override
  Result<bool> get _toDoResult {
    _$_toDoResultAtom.reportRead();
    return super._toDoResult;
  }

  @override
  set _toDoResult(Result<bool> value) {
    _$_toDoResultAtom.reportWrite(value, super._toDoResult, () {
      super._toDoResult = value;
    });
  }

  final _$_toDoListAtom = Atom(name: '_ToDoStoreBase._toDoList');

  @override
  List<ToDo> get _toDoList {
    _$_toDoListAtom.reportRead();
    return super._toDoList;
  }

  @override
  set _toDoList(List<ToDo> value) {
    _$_toDoListAtom.reportWrite(value, super._toDoList, () {
      super._toDoList = value;
    });
  }

  final _$_fetchToDoListAsyncAction =
      AsyncAction('_ToDoStoreBase._fetchToDoList');

  @override
  Future<void> _fetchToDoList() {
    return _$_fetchToDoListAsyncAction.run(() => super._fetchToDoList());
  }

  final _$createToDoAsyncAction = AsyncAction('_ToDoStoreBase.createToDo');

  @override
  Future<void> createToDo(String title, String body, Reminder reminder) {
    return _$createToDoAsyncAction
        .run(() => super.createToDo(title, body, reminder));
  }

  final _$updateToDoAsyncAction = AsyncAction('_ToDoStoreBase.updateToDo');

  @override
  Future<void> updateToDo(ToDo toDo, bool isReminderUpdated) {
    return _$updateToDoAsyncAction
        .run(() => super.updateToDo(toDo, isReminderUpdated));
  }

  final _$deleteToDoAsyncAction = AsyncAction('_ToDoStoreBase.deleteToDo');

  @override
  Future<void> deleteToDo(ToDo toDo) {
    return _$deleteToDoAsyncAction.run(() => super.deleteToDo(toDo));
  }

  final _$setReminderAsyncAction = AsyncAction('_ToDoStoreBase.setReminder');

  @override
  Future<void> setReminder(ToDo toDo) {
    return _$setReminderAsyncAction.run(() => super.setReminder(toDo));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
