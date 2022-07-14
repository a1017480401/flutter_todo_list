import 'package:json_annotation/json_annotation.dart';
part 'todo_item.g.dart';

@JsonSerializable()
class TodoItem extends Object {
  String title;

  String content;

  TodoWeights weights;

  TodoItem(
      {this.title = '', this.content = '', this.weights = TodoWeights.low});

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);

  Map<String, dynamic> toJson() => _$TodoItemToJson(this);
}

enum TodoWeights {
  @JsonValue(0)
  low,
  @JsonValue(1)
  middle,
  @JsonValue(2)
  high,
}
