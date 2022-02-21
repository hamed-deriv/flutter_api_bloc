import 'package:http/http.dart';

import 'package:flutter_api_bloc/models/bored_activity.dart';
import 'package:flutter_api_bloc/services/base_bored_service.dart';

class BoredService implements BaseBoredService {
  @override
  Future<BoredActivity> getBoredActivity() async {
    final Response response =
        await get(Uri.parse('https://www.boredapi.com/api/activity'));

    if (response.statusCode == 200) {
      return boredActivityFromJson(response.body);
    }

    throw Exception('Failed to load Bored Activity.');
  }
}
