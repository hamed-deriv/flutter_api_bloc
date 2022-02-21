import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/services/connectivity_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_api_bloc/home/home_page.dart';
import 'package:flutter_api_bloc/services/bored_service.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => BoredService()),
          RepositoryProvider(create: (context) => ConnectivityService()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
