import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_api_bloc/models/bored_activity.dart';
import 'package:flutter_api_bloc/services/base_bored_service.dart';
import 'package:flutter_api_bloc/services/base_connectivity_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BaseBoredService _boredService;
  final BaseConnectivityService _connectivityService;

  HomeBloc(
    this._boredService,
    this._connectivityService,
  ) : super(HomeInitialState()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>((event, emit) async => await _getBoredActivity(emit));
    on<NoInternetEvent>((event, emit) => emit(HomeNoInternetState()));
  }

  Future<void> _getBoredActivity(Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      emit(HomeLoadedState(await _boredService.getBoredActivity()));
    } on Exception catch (e) {
      emit(HomeErrorState('$e'));
    }
  }
}
