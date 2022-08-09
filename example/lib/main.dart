import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:trackier_sdk_flutter/trackierfluttersdk.dart';
import 'package:trackier_sdk_flutter/trackierconfig.dart';
import 'package:trackier_sdk_flutter/trackierevent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    TrackerSDKConfig trackerSDKConfig =
        new TrackerSDKConfig("0455721b-33c5-4c9f-805e-596d818d910a", "development");//xxfe3694-1ef5-430d-baa7-01ba36332xxx

    Trackierfluttersdk.setUserId("this_is_a_userId");
    Trackierfluttersdk.setUserEmail("userEmail@gmail.com");

    var userAdditonalDetail = Map<String, Object>();
    userAdditonalDetail["phoneNumber"] = 9876453210;

    Trackierfluttersdk.setUserAdditonalDetail(userAdditonalDetail);

    Trackierfluttersdk.initializeSDK(trackerSDKConfig);

    var trackierId = await Trackierfluttersdk.getTrackierId();
    print('The value of trackierId is: $trackierId');

    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await Trackierfluttersdk.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Trackier Flutter Sample App'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'Track Event',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.cyan,
                textColor: Colors.black,
                onPressed:_trackSimpleEvent,
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'Track Revenue Event',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.cyan,
                textColor: Colors.black,
                onPressed: _trackRevenueEvent,
              ),
            ),
          ]))),
    );
  }

    _trackSimpleEvent() {
      TrackierEvent trackierEvent = new TrackierEvent("1CFfUn3xEY");
      trackierEvent.revenue = 70.0;
      trackierEvent.discount = 2.0;
      trackierEvent.currency = "INR";
      trackierEvent.orderId = "orderID";
      trackierEvent.param1 = "param1";
      trackierEvent.param2 = "param2";
      trackierEvent.couponCode = "test1";
      Trackierfluttersdk.setUserName("abc");
      Trackierfluttersdk.setUserPhone("6562127727");
      Trackierfluttersdk.trackerEvent(trackierEvent);
    }

    _trackRevenueEvent() {
      TrackierEvent trackierEvent = new TrackierEvent("1CFfUn3xEY");
      trackierEvent.revenue = 10.0;
      trackierEvent.currency = "INR";
      trackierEvent.orderId = "orderID";
      trackierEvent.param1 = "param1";
      trackierEvent.param2 = "param2";
      trackierEvent.discount = 2.0;
      trackierEvent.couponCode = "test1";
      Trackierfluttersdk.setUserName("abc");
      Trackierfluttersdk.setUserPhone("6562127727");
      trackierEvent.setEventValue("ev1", "eventValue1");
      trackierEvent.setEventValue("ev2", 1);
      Trackierfluttersdk.trackerEvent(trackierEvent);

    }
}
