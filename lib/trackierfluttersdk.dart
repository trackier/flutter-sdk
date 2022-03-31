import 'dart:async';
import 'package:flutter/services.dart';
import 'package:trackier_sdk_flutter/trackierevent.dart';
import 'trackierconfig.dart';
import 'dart:io' show Platform;

class Trackierfluttersdk {
  static const MethodChannel _channel = const MethodChannel('trackierfluttersdk');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void initializeSDK(TrackerSDKConfig config) {
    _channel.invokeMethod('initializeSDK', config.toMap);
  }

  static void trackerEvent(TrackierEvent trackierEvent) {
    _channel.invokeMethod('trackierEvent', trackierEvent.toMap);
  }

  static void setUserId(String userId) {
    _channel.invokeMethod('setUserId', userId);
  }

  static void setUserEmail(String userEmail) {
    _channel.invokeMethod('setUserEmail', userEmail);
  }

  static void setUserAdditonalDetail(Map userAdditonalDetail) {
    _channel.invokeMethod('setUserAdditonalDetail', userAdditonalDetail);
  }

  static Future<String> getTrackierId() async {
    final String installID = await _channel.invokeMethod('getTrackierId');
    return installID;
  }
}
