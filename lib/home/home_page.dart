import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/home/bloc/home_bloc.dart';
import 'package:flutter_api_bloc/services/bored_service.dart';
import 'package:flutter_api_bloc/services/connectivity_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => HomeBloc(
            RepositoryProvider.of<BoredService>(context),
            RepositoryProvider.of<ConnectivityService>(context))
          ..add(LoadApiEvent()),
        child: Scaffold(
          appBar: AppBar(title: const Text('Activity for people')),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadedState) {
                return Column(
                  children: [
                    Text(state.activity.activity),
                    Text(state.activity.type),
                    Text('${state.activity.participants}'),
                    ElevatedButton(
                      child: const Text('Load Next'),
                      onPressed: () => BlocProvider.of<HomeBloc>(context)
                          .add(LoadApiEvent()),
                    )
                  ],
                );
              }

              if (state is HomeErrorState) {
                return Center(child: Text(state.error));
              }

              if (state is HomeNoInternetState) {
                return const Center(child: Text('No internet'));
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      );
}
