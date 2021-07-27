import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageEmptyState());

  @override
  Stream<HomepageState> mapEventToState(
    HomepageEvent event,
  ) async* {
    if (event is HomepageClickEvent) {
      switch (event.buttonEnum) {
        case ButtonEnum.error:
          yield HomepageErrorState();
          break;
        case ButtonEnum.loading:
          yield HomepageLoadingState();
          break;
        case ButtonEnum.success:
          yield HomepageSuccessState();
          break;
        default:
          yield HomepageEmptyState();
          break;
      }
    }
  }
}
