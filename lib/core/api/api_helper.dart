import 'dart:io';

import 'package:world_peace/core/shared/save_data.dart';

mixin ApiHelper {
  Map<String, String> get headers {
    return {
      HttpHeaders.authorizationHeader: AppPreferences().token,
      HttpHeaders.acceptHeader: 'application/json',
    };
  }
}