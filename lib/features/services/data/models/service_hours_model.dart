class ServiceHoursModel {
  final String fromHour;
  final String toHour;

  ServiceHoursModel({required this.fromHour, required this.toHour});

  factory ServiceHoursModel.fromJson(json){
    return ServiceHoursModel(fromHour: json['fromHour'], toHour: json['toHour']);

  }
  Map<String,dynamic> toJson (){
    return {
      'fromHour':fromHour,
      'toHour':toHour
    };
  }
}
