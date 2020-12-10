import 'package:tododemo/models/models.dart';
import 'package:hive/hive.dart';

abstract class ToDoRepository {
  Future<Box<ToDo>> get toDoBox;

  Future<List<ToDo>> get toDos;

  Future<void> cacheToDos(List<ToDo> results);

  Future<void> updateToDo(ToDo toDo);

  Future<void> deleteToDo(ToDo toDo);

  Future<ToDo> getToDoById(final int id);
}