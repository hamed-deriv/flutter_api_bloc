part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  const HomeLoadedState(this.activity);

  final BoredActivity activity;

  @override
  List<Object?> get props => [activity];
}

class HomeNoInternetState extends HomeState {}

class HomeErrorState extends HomeState {
  const HomeErrorState(this.error);

  final String error;
}
