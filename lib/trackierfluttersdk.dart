import 'dart:async';
import 'dart:ffi';
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

  static void trackEvent(TrackierEvent trackierEvent) {
    _channel.invokeMethod('trackierEvent', trackierEvent.toMap);
  }

  static void setUserId(String userId) {
    _channel.invokeMethod('setUserId', userId);
  }

  static void setUserEmail(String userEmail) {
    _channel.invokeMethod('setUserEmail', userEmail);
  }

  static void setUserPhone(String userPhone) {
    _channel.invokeMethod('setUserPhone', userPhone);
  }

  static void setUserName(String userName) {
    _channel.invokeMethod('setUserName', userName);
  }

  static void setDOB(String dob) {
    _channel.invokeMethod('setDOB', dob);
  }

  static void setGender(Gender gender) {
    _channel.invokeMethod('setGender', gender.toString());
  }

  static void updatePostbackConversion(int conversion) {
    _channel.invokeMethod('updatePostbackConversion', conversion);
  }

  static void setUserAdditonalDetail(Map userAdditonalDetail) {
    _channel.invokeMethod('setUserAdditonalDetail', userAdditonalDetail);
  }

  static void setPreinstallAttribution(String pid, String campaign, String campaignId) {
    final Map<String, String> parameters = {'pid': pid, 'campaign': campaign, 'campaignId': campaignId,};
    _channel.invokeMethod('setPreinstallAttribution', parameters);
  }

  static Future<String> getTrackierId() async {
    final String installID = await _channel.invokeMethod('getTrackierId');
    return installID;
  }

  static Future<String> getAd() async {
    return await _channel.invokeMethod('getAd');
  }

  static Future<String> getAdID() async {
    return await _channel.invokeMethod('getAdID');
  }

  static Future<String> getAdSet() async {
    return await _channel.invokeMethod('getAdSet');
  }

  static Future<String> getAdSetID() async {
    return await _channel.invokeMethod('getAdSetID');
  }

  static Future<String> getCampaign() async {
    return await _channel.invokeMethod('getCampaign');
  }

  static Future<String> getCampaignID() async {
    return await _channel.invokeMethod('getCampaignID');
  }

  static Future<String> getP1() async {
    return await _channel.invokeMethod('getP1');
  }

  static Future<String> getP2() async {
    return await _channel.invokeMethod('getP2');
  }

  static Future<String> getP3() async {
    return await _channel.invokeMethod('getP3');
  }

  static Future<String> getP4() async {
    return await _channel.invokeMethod('getP4');
  }

  static Future<String> getP5() async {
    return await _channel.invokeMethod('getP5');
  }

  static Future<String> getClickId() async {
    return await _channel.invokeMethod('getClickId');
  }

  static Future<String> getDlv() async {
    return await _channel.invokeMethod('getDlv');
  }

  static Future<String> getPid() async {
    return await _channel.invokeMethod('getPid');
  }

  static Future<String> getIsRetargeting() async {
    return await _channel.invokeMethod('getIsRetargeting');
  }
}

enum Gender {
  Male,
  Female,
  Others,
}
