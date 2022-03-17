import 'package:flutter/services.dart';

class TrackerSDKConfig {
  String appToken = "";
  String envirnoment = "";
  String secretId = "";
  String secretKey = "";

  TrackerSDKConfig(String appToken, String envirnoment) {
    this.appToken = appToken;
    this.envirnoment = envirnoment;
  }

  void setAppSecret(String secretId, String secretKey) {
    this.secretId = secretId;
    this.secretKey = secretKey;
  }

  Map<String, String?> get toMap {
    Map<String, String?> configMap = {
      'appToken': appToken,
      'environment': envirnoment,
      'secretId': secretId,
      'secretKey': secretKey,
    };

    return configMap;
  }
}
