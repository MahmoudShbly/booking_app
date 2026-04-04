class ServiceModel {
  final int id;
  final String name;
  final String bookPrice;
  final String fullPrice;
  final String description;
  final String mainImage;
  final List<dynamic> images;
  final String city;
  final String location;
  final String categoryId;

  ServiceModel({
    required this.id,
    required this.name,
    required this.bookPrice,
    required this.fullPrice,
    required this.description,
    required this.images,
    required this.city,
    required this.location,
    required this.categoryId    ,
    required this.mainImage,
  });

  factory ServiceModel.fromJson(json) => ServiceModel(
    id: json['id'],
    name: json['name'] ?? '',
    bookPrice: json['book_price'] ?? '',
    fullPrice: json['fullPrice'] ?? '',
    description: json['description'] ?? '',
    images: json['otherImages'] ?? [],
    city: json['city'] ?? '',
    location: json['location'] ?? '',
    categoryId: json['categoryId'] ?? '',
    mainImage: '${json['mainImage'] ?? ''}',
  );
}
