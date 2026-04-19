class ServiceInfoModel {
final int id;
final String name;

ServiceInfoModel({
  required this.id,
  required this.name,
});

factory ServiceInfoModel.fromJson(Map<String, dynamic> json) {
  return ServiceInfoModel(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
  };
}
}