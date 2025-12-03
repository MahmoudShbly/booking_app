part of 'be_provider_cubit.dart';

@immutable
sealed class BeProviderState {}

final class BeProviderInitial extends BeProviderState {}

final class BeProviderCategorySelected extends BeProviderState {}

final class BeProviderFromDayChanged extends BeProviderState {}
final class BeProviderToDayChanged extends BeProviderState {}
