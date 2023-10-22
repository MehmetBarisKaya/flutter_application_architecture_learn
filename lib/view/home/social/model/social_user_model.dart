// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'social_user_model.g.dart';

@JsonSerializable()
class SocialUser extends INetworkModel<SocialUser> {
  int? userId;
  int? id;
  String? title;
  String? body;

  SocialUser({this.userId, this.id, this.title, this.body});

  Map<String, dynamic> toJson() {
    return _$SocialUserToJson(this);
  }

  @override
  SocialUser fromJson(Map<String, dynamic> json) {
    return _$SocialUserFromJson(json);
  }

  @override
  bool operator ==(covariant SocialUser other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
