import 'package:booking_app/features/home/data/models/categories_model.dart';
import 'package:booking_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_categories_state.dart';

class FetchCategoriesCubit extends Cubit<FetchCategoriesState> {
  final HomeRepoImpl homeRepoImpl;
  FetchCategoriesCubit(this.homeRepoImpl) : super(FetchCategoriesInitial());
  List<CategoriesModel> allCategories = [];
  Future<void> fetchCategories() async {
    emit(FetchCategoriesLoading());
    var result = await homeRepoImpl.fetchCategories();
    result.fold(
      (failure) {
        emit(FetchCategoriesFailure(failure.errorMessage));
      },
      (categories) {
        allCategories = categories;
        emit(FetchCategoriesSuccess());
      },
    );
  }
}
