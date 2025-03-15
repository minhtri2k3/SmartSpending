import '../core/export.dart';

part 'sm_todo.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class SMTodo {
  String task;
  String type;
  bool isDone;
  int? startTimeClock;
  int? startTimeMinute;
  int? endTimeClock;
  int? endTimeMinute;

  // @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  // Timestamp createdOn;
  // @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  // Timestamp updatedOn;

  SMTodo({
    required this.task,
    required this.isDone,
    required this.type,
    // required this.createdOn,
    // required this.updatedOn,
    this.startTimeClock,
    this.startTimeMinute,
    this.endTimeClock,
    this.endTimeMinute,
  });

  factory SMTodo.fromJson(Map<String, dynamic> json) => _$SMTodoFromJson(json);

  Map<String, dynamic> toJson() => _$SMTodoToJson(this);

// static Timestamp _timestampFromJson(dynamic json) {
//   return json != null
//       ? Timestamp.fromMillisecondsSinceEpoch(json as int)
//       : Timestamp.now();
// }
//
// static int _timestampToJson(Timestamp timestamp) {
//   return timestamp.millisecondsSinceEpoch;
// }
}
