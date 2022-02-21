import 'package:flutter_api_bloc/models/bored_activity.dart';

abstract class BaseBoredService {
  Future<BoredActivity> getBoredActivity();
}
