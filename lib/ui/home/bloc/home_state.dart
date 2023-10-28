part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<DressEntity> dresses;

  const HomeSuccess(this.dresses);

  @override
  List<Object> get props => [dresses];
}

class HomeError extends HomeState {}
