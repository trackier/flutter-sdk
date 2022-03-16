import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:trackier_flutter_sdk/trackierfluttersdk.dart';
import 'package:trackier_flutter_sdk/trackierconfig.dart';
import 'package:trackier_flutter_sdk/trackierevent.dart';

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
        new TrackerSDKConfig("xxxx-xx-4505-bc8b-xx", "production");

    Trackierfluttersdk.setUserId("userId");
    Trackierfluttersdk.setUserEmail("userEmail@gmail.com");

    var userAdditonalDetail = Map<String, Object>();
    userAdditonalDetail["phoneNumber"] = 9876453210;

    Trackierfluttersdk.setUserAdditonalDetail(userAdditonalDetail);

    Trackierfluttersdk.initializeSDK(trackerSDKConfig);

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
      TrackierEvent trackierEvent = new TrackierEvent("eventID");
      trackierEvent.orderId = "orderID";
      trackierEvent.param1 = "param1";
      trackierEvent.param2 = "param2";
      trackierEvent.setEventValue("ev1", "eventValue1");
      trackierEvent.setEventValue("ev2", 1);
      Trackierfluttersdk.trackerEvent(trackierEvent);

    }

    _trackRevenueEvent() {
      TrackierEvent trackierEvent = new TrackierEvent("eventID");
      trackierEvent.revenue = 10.0;
      trackierEvent.currency = "INR";
      trackierEvent.orderId = "orderID";
      trackierEvent.param1 = "param1";
      trackierEvent.param2 = "param2";
      trackierEvent.setEventValue("ev1", "eventValue1");
      trackierEvent.setEventValue("ev2", 1);
      Trackierfluttersdk.trackerEvent(trackierEvent);

    }
}
