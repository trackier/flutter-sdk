import 'dart:ffi';

import 'package:flutter/services.dart';

class TrackierEvent {
  String eventId = "";
  String orderId = "";
  String couponCode = "";
  double discount = 0.0;
  double revenue = 0.0;
  String currency = "";
  String param1 = "";
  String param2 = "";
  String param3 = "";
  String param4 = "";
  String param5 = "";
  String param6 = "";
  String param7 = "";
  String param8 = "";
  String param9 = "";
  String param10 = "";

  Map<String, Object> evMap = Map();

  TrackierEvent(String eventId) {
    this.eventId = eventId;
  }

  setEventValue(String key, Object value) {
    evMap[key] = value;
  }

  Map<String, Object?> get toMap {
    Map<String, Object?> eventMap = {
      'eventId': eventId,
      'orderId': orderId,
      'c_code' : couponCode,
      'discount' : discount,
      'currency': currency,
      'revenue': revenue,
      'param1': param1,
      'param2': param2,
      'param3': param3,
      'param4': param4,
      'param5': param5,
      'param6': param6,
      'param7': param7,
      'param8': param8,
      'param9': param9,
      'param10': param10,
      'ev': evMap,
    };

    return eventMap;
  }

  static const String LEVEL_ACHIEVED = "1CFfUn3xEY";
  static const String ADD_TO_CART = "Fy4uC1_FlN";
  static const String ADD_TO_WISHLIST = "AOisVC76YG";
  static const String COMPLETE_REGISTRATION = "mEqP4aD8dU";
  static const String TUTORIAL_COMPLETION = "99VEGvXjN7";
  static const String PURCHASE = "Q4YsqBKnzZ";
  static const String SUBSCRIBE = "B4N_In4cIP";
  static const String START_TRIAL = "jYHcuyxWUW";
  static const String ACHIEVEMENT_UNLOCKED = "xTPvxWuNqm";
  static const String CONTENT_VIEW = "Jwzois1ays";
  static const String TRAVEL_BOOKING = "yP1-ipVtHV";
  static const String SHARE = "dxZXGG1qqL";
  static const String INVITE = "7lnE3OclNT";
  static const String LOGIN = "o91gt1Q0PK";
  static const String UPDATE = "sEQWVHGThl";
}
