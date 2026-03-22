

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());
  int rating = 0;
  void changeRate (index){
    rating = index;
    emit(RatingChangedState());
  }
}
