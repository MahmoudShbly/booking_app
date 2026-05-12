class ServiceDaysModel {
  final String fromDay;
  final String toDay;

  ServiceDaysModel({required this.fromDay, required this.toDay});
  
  factory ServiceDaysModel.fromJson (json){
    return ServiceDaysModel(fromDay: json['fromDay'], toDay: json['toDay']);
  }

  Map<String,dynamic> toJson (){
    return {
      'fromDay':fromDay,
      'toDay':toDay
    };
  }
}
