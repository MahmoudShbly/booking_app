import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());
  int rating = 0;
  void changeRate (index){
    rating = index;
    emit(RatingChangedState());
  }
}
