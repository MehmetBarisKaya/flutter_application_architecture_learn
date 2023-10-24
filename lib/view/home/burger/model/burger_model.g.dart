// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BurgerModel _$BurgerModelFromJson(Map<String, dynamic> json) => BurgerModel()
  ..id = json['_id'] as String?
  ..image = json['image'] as String?
  ..name = json['name'] as String?
  ..price = (json['price'] as num?)?.toDouble()
  ..rates = (json['rates'] as num?)?.toDouble()
  ..isFavorite = json['isFavorite'] as bool?
  ..updated = json['updated'] as String?;

Map<String, dynamic> _$BurgerModelToJson(BurgerModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'rates': instance.rates,
      'isFavorite': instance.isFavorite,
      'updated': instance.updated,
    };
