import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shirt/data/dress.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<HomeEvent>((event, emit) {
      if (event is HomeStarted) {
        emit(HomeLoading());
        final List<DressEntity> dresses = [
          DressEntity('Cotton queen T', 83.00, ['assets/img/2/1.jpg']),
          DressEntity('Cotton Style T', 40.50, ['assets/img/1/1.jpg']),
          DressEntity('Cotton queen T', 43.00, ['assets/img/3/1.jpg']),
          DressEntity('Cotton queen T', 83.00, ['assets/img/2/1.jpg']),
          DressEntity('Cotton Style T', 40.50, ['assets/img/1/1.jpg']),
          DressEntity('Cotton queen T', 43.00, ['assets/img/3/1.jpg']),
          DressEntity('Cotton queen T', 43.00, ['assets/img/3/1.jpg']),
          DressEntity('Cotton Style T', 40.50, ['assets/img/1/1.jpg']),
        ];

        emit(HomeSuccess(dresses));
      }
    });
  }
}
