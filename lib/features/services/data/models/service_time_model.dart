class ServiceTimeModel {
  final String hour;
  final String minute;
  ServiceTimeModel({required this.hour, required this.minute});

  factory ServiceTimeModel.fromJson (json){
    return ServiceTimeModel(hour: json['hour'], minute: json['minute']);
  }

  Map<String,dynamic> toJson(){
    return {
      'hour':hour,
      'minute':minute
    };
  }
}
