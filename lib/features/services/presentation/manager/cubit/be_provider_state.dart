part of 'be_provider_cubit.dart';

@immutable
sealed class BeProviderState {}

final class BeProviderInitial extends BeProviderState {}

final class BeProviderCategorySelected extends BeProviderState {}
final class BeProviderCityChanged extends BeProviderState {}
final class BeProviderFromDayChanged extends BeProviderState {}
final class BeProviderToDayChanged extends BeProviderState {}
final class BeProviderHourChanged extends BeProviderState {}
final class BeProviderMinuteChanged extends BeProviderState {}
final class BeProviderMainImageUploaded extends BeProviderState{
  final XFile image;
  BeProviderMainImageUploaded({required this.image});
}
