part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}

class HomepageClickEvent extends HomepageEvent {
  final ButtonEnum buttonEnum;
  HomepageClickEvent(this.buttonEnum);
}

enum ButtonEnum {
  empty, error, loading, success
}