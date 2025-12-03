import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'be_provider_state.dart';

class BeProviderCubit extends Cubit<BeProviderState> {
  BeProviderCubit() : super(BeProviderInitial());

  //category selection view
  int selectedIndex = -1;
  late String category;

  List<String> categories = ["ملعب", "مسبح", "حلاقة", "سفر", "عيادة"];

  void selectCategory(int index) {
    selectedIndex = index;
    category = categories[selectedIndex];
    emit(BeProviderCategorySelected());
  }

  //about your service view
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
}
