// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sm_todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SMTodo _$SMTodoFromJson(Map<String, dynamic> json) => SMTodo(
      task: json['task'] as String,
      isDone: json['is_done'] as bool,
      type: json['type'] as String,
      startTimeClock: (json['start_time_clock'] as num?)?.toInt(),
      startTimeMinute: (json['start_time_minute'] as num?)?.toInt(),
      endTimeClock: (json['end_time_clock'] as num?)?.toInt(),
      endTimeMinute: (json['end_time_minute'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SMTodoToJson(SMTodo instance) {
  final val = <String, dynamic>{
    'task': instance.task,
    'type': instance.type,
    'is_done': instance.isDone,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_time_clock', instance.startTimeClock);
  writeNotNull('start_time_minute', instance.startTimeMinute);
  writeNotNull('end_time_clock', instance.endTimeClock);
  writeNotNull('end_time_minute', instance.endTimeMinute);
  return val;
}
