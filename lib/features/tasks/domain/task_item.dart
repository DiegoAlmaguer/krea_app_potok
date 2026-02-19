import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_item.freezed.dart';
part 'task_item.g.dart';

@freezed
class TaskItem with _$TaskItem {
  const factory TaskItem({
    required String id,
    required String projectId,
    required String title,
    required String status,
    String? assigneeId,
    DateTime? dueDate,
  }) = _TaskItem;

  factory TaskItem.fromJson(Map<String, dynamic> json) => _$TaskItemFromJson(json);
}
