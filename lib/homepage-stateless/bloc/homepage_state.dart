part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageEmptyState extends HomepageState {}
class HomepageErrorState extends HomepageState {}
class HomepageLoadingState extends HomepageState {}
class HomepageSuccessState extends HomepageState {}
