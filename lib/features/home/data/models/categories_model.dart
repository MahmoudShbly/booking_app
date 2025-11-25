import 'package:booking_app/core/utlis/api_keys.dart';

class CategoriesModel {
  final String id;
  final String name;


  CategoriesModel({
    required this.id,
    required this.name,

  });

  factory CategoriesModel.fromJson(dynamic json) {
   return CategoriesModel(id: json[ApiKeys.id], name: json[ApiKeys.name] );
  }

Map<String, dynamic> toJson(CategoriesModel model) {
  return {
    ApiKeys.id: model.id,
    ApiKeys.name: model.name,
  };
}
}