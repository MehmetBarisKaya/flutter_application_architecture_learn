// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends INetworkModel<LoginModel> {
  final String? email;
  final String? password;

  LoginModel({
    this.email,
    this.password,
  });

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginModelToJson(this);
  }
}
