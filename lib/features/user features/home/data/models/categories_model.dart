
class CategoriesModel {
  final int id;
  final String name;
  final String? imageUrl;


  CategoriesModel({
    required this.id,
    required this.name,
    this.imageUrl,
  });

  factory CategoriesModel.fromJson(dynamic json) {
   return CategoriesModel(id: json['id'], name: json['name'], imageUrl: json['image_url']);
  }

Map<String, dynamic> toJson(CategoriesModel model) {
  return {
    'id': model.id,
    'name': model.name,
    'image_url': model.imageUrl,
  };
}
}