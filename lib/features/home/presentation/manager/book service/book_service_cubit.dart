import 'package:booking_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_service_state.dart';

class BookServiceCubit extends Cubit<BookServiceState> {
  BookServiceCubit(this.homeRepo) : super(BookServiceInitial());
  final HomeRepoImpl homeRepo;

  void resetBookingState(int serviceId) {
    final currentState = state;
    if (currentState is BookServiceSuccess && currentState.serviceId == serviceId) {
      emit(BookServiceInitial());
    }
  }

  Future<void> bookService(int id) async {
    if (state is BookServiceLoading && (state as BookServiceLoading).serviceId == id) {

      //TODO : what is (state as BookingServiceLoading) do
      return;
    }

    if (state is BookServiceSuccess && (state as BookServiceSuccess).serviceId == id) {
      return;
    }

    emit(BookServiceLoading(serviceId: id));
    var result = await homeRepo.bookServices(id);
    result.fold(
      (failure) => emit(BookServiceFailure(serviceId: id, errorMessage: failure.errorMessage)),
      (success) => emit(BookServiceSuccess(serviceId: id, successMessage: success)),
    );
  }
}
