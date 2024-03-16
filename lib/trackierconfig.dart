import 'package:flutter/services.dart';

typedef void DeferredDeeplinkCallback(String? uri);

class TrackerSDKConfig {
  String appToken = "";
  String envirnoment = "";
  String secretId = "";
  String secretKey = "";
  bool manualMode = false;
  bool disableOrganic = false;

  DeferredDeeplinkCallback? deferredDeeplinkCallback;

  static const MethodChannel _channel = const MethodChannel('trackierfluttersdk');
  static const String _deferredDeeplinkCallbackName = 'deferred-deeplink';

  TrackerSDKConfig(String appToken, String envirnoment) {
    this.appToken = appToken;
    this.envirnoment = envirnoment;
    _initCallbackHandlers();
  }

  void setAppSecret(String secretId, String secretKey) {
    this.secretId = secretId;
    this.secretKey = secretKey;
  }
  
  void setManualMode(bool value) {
    this.manualMode = value;
  }

  void disableOrganicTracking(bool value) {
    this.disableOrganic = value;
  }

  void _initCallbackHandlers() {
    _channel.setMethodCallHandler((MethodCall call) async {
      try {
        switch (call.method) {
          case _deferredDeeplinkCallbackName:
            if (deferredDeeplinkCallback != null) {
              String? uri = call.arguments['uri'];
              deferredDeeplinkCallback!(uri);
            }
            break;
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }

  Map<String, dynamic> get toMap {
    Map<String, dynamic> configMap = {
      'appToken': appToken,
      'environment': envirnoment,
      'secretId': secretId,
      'secretKey': secretKey,
      'deeplinkCallback' : _deferredDeeplinkCallbackName,
      'setManualMode' : manualMode,
      'disableOrganicTracking' : disableOrganic
    };

    return configMap;
  }
}
