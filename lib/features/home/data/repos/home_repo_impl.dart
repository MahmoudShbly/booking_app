import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utlis/api_services.dart';
import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<ServiceModel>>> fetchServices() async {
    try{
      var result =await ApiServices().get(endPoint: 'endPoint');
      List<ServiceModel> services = [];
      for(var item in  result)
        {services.add(ServiceModel.fromJson(item));}
      return right(services);

    }
    catch(e){
      if (e is DioException){
        
        return left (ServerFailure.fromDioError(e));
      }
      return left (ServerFailure(e.toString()));
    }
  }

}