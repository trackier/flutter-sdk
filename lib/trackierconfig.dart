import 'package:flutter/services.dart';

class TrackerSDKConfig {
  String appToken = "";
  String envirnoment = "";

  TrackerSDKConfig(String appToken, String envirnoment) {
    this.appToken = appToken;
    this.envirnoment = envirnoment;
  }

  Map<String, String?> get toMap {
    Map<String, String?> configMap = {
      'appToken': appToken,
      'environment': envirnoment,
    };

    return configMap;
  }
}
