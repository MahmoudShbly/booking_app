part of 'fetch_categories_cubit.dart';

@immutable
sealed class FetchCategoriesState {}

final class FetchCategoriesInitial extends FetchCategoriesState {}
final class FetchCategoriesLoading extends FetchCategoriesState {}
final class FetchCategoriesSuccess extends FetchCategoriesState {}
final class FetchCategoriesFailure extends FetchCategoriesState {
  final String errorMessage;
  FetchCategoriesFailure(this.errorMessage);
}
