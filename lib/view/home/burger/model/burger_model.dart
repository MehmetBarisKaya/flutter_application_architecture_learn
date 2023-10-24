import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'burger_model.g.dart';

@JsonSerializable()
class BurgerModel extends INetworkModel<BurgerModel> {
  @JsonKey(name: '_id')
  String? id;
  String? image;
  String? name;
  double? price;
  double? rates;
  bool? isFavorite;
  String? updated;
  @override
  fromJson(Map<String, dynamic> json) {
    return _$BurgerModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BurgerModelToJson(this);
  }
}
