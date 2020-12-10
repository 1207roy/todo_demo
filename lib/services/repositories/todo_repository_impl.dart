import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/services/todo_repository.dart';

@LazySingleton(as: ToDoRepository)
class ToDoRepositoryImpl implements ToDoRepository {
  static const String _toDoBoxKey = 'to_do_box';

  @override
  Future<Box<ToDo>> get toDoBox async =>
      await Hive.openBox<ToDo>(_toDoBoxKey);

  @override
  Future<List<ToDo>> get toDos async {
    final Box<ToDo> toDoCache = await toDoBox;
    List<ToDo> list;
    try {
      if (toDoCache.isNotEmpty) {
        // from cache.
        list = toDoCache.values.toList();
      } else {
        list = [];
      }
    } catch (e) {
      print(e);
      list = [];
    }
//    await toDoCache.close();
    return list;
  }

  @override
  Future<void> cacheToDos(List<ToDo> results) async {
    final box = await toDoBox;
    Map<String, ToDo> toDosMap = Map.fromIterable(results, key: (e) => '${e.id}', value: (e) => e);
    await box.putAll(toDosMap);
  }

  @override
  Future<void> updateToDo(ToDo toDo) async {
    final box = await toDoBox;
    await box.put('${toDo.id}', toDo);
  }

  @override
  Future<void> deleteToDo(ToDo toDo) async {
    final box = await toDoBox;
    await box.delete('${toDo.id}');
  }

  @override
  Future<ToDo> getToDoById(final int id) async {
    final Box<ToDo> toDoCache = await toDoBox;
    ToDo todo;
    if (toDoCache.containsKey(id)) {
      // from cache.
      todo = toDoCache.get(id);
    }
//    await toDoCache.close();
    return todo;
  }
}

