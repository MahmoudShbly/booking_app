import 'package:booking_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_service_state.dart';

class BookServiceCubit extends Cubit<BookServiceState> {
  BookServiceCubit(this.homeRepo) : super(BookServiceInitial());
  final HomeRepoImpl homeRepo;

  Future<void> bookService(int id) async {
    emit(BookServiceLoading());
    var result = await homeRepo.bookServices(id);
    result.fold(
      (failure) => emit(BookServiceFailure(errorMessage: failure.errorMessage)),
      (success) => emit(BookServiceSuccess(successMessage: success)),
    );
  }
}
