
class CategoriesModel {
  final int id;
  final String name;


  CategoriesModel({
    required this.id,
    required this.name,

  });

  factory CategoriesModel.fromJson(dynamic json) {
   return CategoriesModel(id: json['id'], name: json['name'] );
  }

Map<String, dynamic> toJson(CategoriesModel model) {
  return {
    'id': model.id,
    'name': model.name,
  };
}
}