// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialUser _$SocialUserFromJson(Map<String, dynamic> json) => SocialUser(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$SocialUserToJson(SocialUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
