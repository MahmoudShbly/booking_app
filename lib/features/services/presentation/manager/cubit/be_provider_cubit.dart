import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'be_provider_state.dart';

class BeProviderCubit extends Cubit<BeProviderState> {
  BeProviderCubit() : super(BeProviderInitial());

  int selectedIndex = -1;

  List<String> categories = [
    "ملعب",
    "مسبح",
    "حلاقة",
    "سفر",
    "عيادة",
  ];

  void selectCategory(int index) {
    selectedIndex = index;
    emit(BeProviderCategorySelected());
  }
}
