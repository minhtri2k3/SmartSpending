import '../core/export.dart';

const String TODO_COLLECTION_REF = "todo";

class SMDatabaseService {
  final fireStore = FirebaseFirestore.instance;

  late final CollectionReference todoRef;

  SMDatabaseService() {
    todoRef = fireStore.collection(TODO_COLLECTION_REF).withConverter<SMTodo>(
        fromFirestore: (snapshots, _) => SMTodo.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (todo, _) => todo.toJson());
  }

  Stream<QuerySnapshot> getTodos() {
    return todoRef.snapshots();
  }

  void addTodo(SMTodo todo, String day) async {
    await fireStore
        .collection("todo")
        .doc(day)
        .collection("tasks")
        .add(todo.toJson());
    // await todoRef.add(todo);
  }

  void updateTodo(String todoId, SMTodo todo) {
    todoRef.doc(todoId).update(todo.toJson());
  }

  Stream<QuerySnapshot> getTodosByDay(String day) {
    return fireStore
        .collection("todo")
        .doc(day)
        .collection("tasks")
        .snapshots();
  }
}
