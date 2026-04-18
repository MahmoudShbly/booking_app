import 'package:booking_app/features/services/data/repos/customer/customer_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'be_provider_state.dart';

class BeProviderCubit extends Cubit<BeProviderState> {
  BeProviderCubit(this.servicesRepo) : super(BeProviderInitial());
  final CustomerRepoImpl servicesRepo;
  Future<void> addService() async {
    emit(BeProviderLoading());
    FormData formData = FormData.fromMap({
      "category_id": 1,
      "name": serviceName.text,
      "description": serviceDescription.text,
      "city": city,
      "location": serviceLocation.text,
      "book_price": bookPrice.text,
      "fullPrice": fullPrice.text,
      "time_to_complete": "$hour : $minute",
      "available_days[]": [fromDay, toDay],
      "available_hours[]": [firstTime.text, lastTime.text],
      "otherImages[]":  [ await MultipartFile.fromFile(mainImage!.path),
        if (images != null)
          for (var image in images!)
            await MultipartFile.fromFile(image.path)
      ],
    });
    var result = await servicesRepo.addServices(formData);
    result.fold(
      (failure) => emit(BeProviderFailure(failure.errorMessage)),
      (message) => emit(BeProviderSuccess(message)),
    );
  }

  //category selection view
  int selectedIndex = -1;
  late String category;

  List<String> categories = ["ملعب", "مسبح", "حلاقة", "عيادة"];

  void selectCategory(int index) {
    selectedIndex = index;
    category = categories[selectedIndex];
    emit(BeProviderCategorySelected());
  }

  //about your service view
  List<String> cities = [
    'الرقة',
    'حمص',
    'دمشق',
    'ريف دمشق',
    'حلب',
    'ادلب',
    'دير الزور',
    'اللاذقية',
    'الحسكة',
    'حماة',
    'طرطوس',
    'القنيطرة',
    'درعا',
    'السويداء',
  ];
  String city = 'الرقة';
  void changeCity(String newCity) {
    city = newCity;
    emit(BeProviderCityChanged());
  }

  List<String> days = [
    'الاحد',
    'الاتنين',
    'الثلاثاء',
    'الاربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
  ];

  String fromDay = 'الاحد';
  void changeFromDay(String day) {
    fromDay = day;
    emit(BeProviderFromDayChanged());
  }

  String toDay = 'الخميس';
  void changeToDay(String day) {
    toDay = day;
    emit(BeProviderToDayChanged());
  }

  int hour = 0;
  int minute = 15;

  void changeHour(int newHour) {
    hour = newHour;
    emit(BeProviderHourChanged());
  }

  void changeMinute(int newMinute) {
    minute = newMinute;
    emit(BeProviderMinuteChanged());
  }


  final TextEditingController serviceName = TextEditingController();
  final TextEditingController serviceDescription = TextEditingController();
  final TextEditingController serviceLocation = TextEditingController();
  final TextEditingController bookPrice = TextEditingController();
  final TextEditingController fullPrice = TextEditingController();
  final TextEditingController firstTime = TextEditingController();
  final TextEditingController lastTime = TextEditingController();
  XFile? mainImage;
  List<XFile>? images;
  bool isTermsAccepted = false;

  Future<void> selectTime(
    TextEditingController controller,
    BuildContext context,
  ) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      controller.text = selectedTime.format(context);
    }
  }

  @override
  Future<void> close() {
    serviceName.dispose();
    serviceLocation.dispose();
    bookPrice.dispose();
    fullPrice.dispose();
    firstTime.dispose();
    lastTime.dispose();
    return super.close();
  }

  void setMainImage(XFile image) {
    mainImage = image;
    emit(BeProviderMainImageUploaded(image: image));
  }

  void setImages(List<XFile> imageList) {
    images = imageList;
    emit(BeProviderMultiImageUploaded(image: imageList));
  }

  void toggleTermsAccepted(bool? value) {
    isTermsAccepted = value ?? false;
    emit(BeProviderTermsAcceptedToggled());
  }

  void clearData() {
    selectedIndex = -1;
    category = '';
    city = 'الرقة';
    fromDay = 'الاحد';
    toDay = 'الخميس';
    hour = 0;
    minute = 15;
    serviceName.clear();
    serviceDescription.clear();
    serviceLocation.clear();
    bookPrice.clear();
    fullPrice.clear();
    firstTime.clear();
    lastTime.clear();
    mainImage = null;
    images = null;
    isTermsAccepted = false;
    emit(BeProviderInitial());
  }
}
