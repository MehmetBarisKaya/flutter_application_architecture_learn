import 'package:equatable/equatable.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends BaseModel with EquatableMixin {
  TestModel({this.userId, this.id, this.title, this.completed});
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  Map<String, dynamic> toJson() {
    return _$TestModelToJson(this);
  }

  @override
  List<Object?> get props => [userId, id, title, completed];

  TestModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return TestModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  fromjson(Map<String, Object> json) {
    return _$TestModelFromJson(json);
  }
}
