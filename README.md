# flutter sdk

## Table of Content

### Integration

- [Add Trackier SDK to your app](#qs-add-trackier-sdk)
  - [Add the SDK ](#qs-add-sdk)
  - [Adding Android install referrer to your app](#qs-add-install-referre)
  - [Add required permissions](#qs-add-request-permissions)
  - [Update Pod Dependencies](#qs-update-pod-dependencies)
- [Implement and initialize the SDK](#qs-implement-trackier-sdk)
  - [Retrieve your dev key](#qs-retrieve-dev-key)
  - [Initialize the SDK](#qs-initialize-trackier-sdk)
  - [Associate User Info during initialization of sdk](#qs-assosoiate-user-info)
- [SDK Signing](#qs-sdk-signing)
- [Track Events](#qs-track-event)
  - [Retrieve Event Id from dashboard](#qs-retrieve-event-id)
  - [Track Simple Event](#qs-track-simple-event)
  - [Track with Currency & Revenue Event](#qs-track-event-with-currencey)
  - [Add custom params with event](#qs-add-custom-parms-event)
- [Track Uninstall for Android](#qs-track-uninstall-android)
- [Proguard Settings](#qs-progaurd-trackier-sdk)

## <a id="qs-add-trackier-sdk"></a>Add Trackier SDK to your app

### <a id="qs-add-sdk"></a>Add the SDK

<p>Run this command:

With Flutter:</p>

```gradle
 $ flutter pub add trackier_sdk_flutter
```

<p>This will add a line like this to your package's pubspec.yaml</p>

```dart
 dependencies:
  trackier_sdk_flutter: ^1.2.1
```

<p>Then navigate to your project in the terminal and run:</p>

```gradle
  $ flutter packages get
```

## <a id="qs-add-install-referre"></a>Adding Android install referrer to your app

Add the Android Install Referrer as a dependency. You can find the latest version [here]()

```gradle
  dependencies {
    // make sure to use the latest SDK version:

    implementation 'com.android.installreferrer:installreferrer:2.2'
  }
```

## <a id="qs-add-request-permissions"></a>Add required permissions

```java
  <uses-permission android:name="android.permission.INTERNET" />
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
  <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />

  <!-- Optional : -->
  <uses-permission android:name="android.permission.READ_PHONE_STATE" />
```

## <a id="qs-update-pod-dependencies"></a> Update Pod Dependencies

<p>For iOS app make sure to go to ios folder and install Cocoapods dependencies:</p>

```gradle
     $ cd ios && pod install
```

## <a id="qs-implement-trackier-sdk"></a>Implement and initialize the SDK

### <a id="qs-retrieve-dev-key"></a>Retrieve your dev key

<img width="1210" alt="Screenshot 2021-08-03 at 3 13 00 PM" src="https://user-images.githubusercontent.com/34488320/127995061-b9cd8899-7236-441c-b594-3ce83aa54c0b.png">

### <a id="qs-initialize-trackier-sdk"></a>Initialize the SDK

Import the following libraries

---

```dart
    import 'package:trackier_sdk_flutter/trackierfluttersdk.dart';
    import 'package:trackier_sdk_flutter/trackierconfig.dart';
    import 'package:trackier_sdk_flutter/trackierevent.dart';
```

<p>
Important: it is crucial to use the correct dev key when initializing the SDK. Using the wrong dev key or an
incorrect dev key impact all traffic sent from the SDK and cause attribution and reporting issues.
</p>

Inside the class, inside initPlatformState function , initialize SDK

```dart
    TrackerSDKConfig trackerSDKConfig = new TrackerSDKConfig("xxxx-xx-4505-bc8b-xx", "production");
    Trackierfluttersdk.initializeSDK(trackerSDKConfig);
```

- The first argument is your Trackier Sdk api key.
- The second argument is environment which can be either "development" or "production" or "testing"
- After that pass the sdkConfig reference to TrackierSDK.initialize method.

## <a id="qs-assosoiate-user-info"></a>Assosiate User Info during initialization of sdk

To assosiate Customer Id , Customer Email and Customer additional params during initializing sdk

```dart
    TrackierSDK.setUserId("XXXXXXXX");
    TrackierSDK.setUserEmail("abc@gmail.com");
    TrackierSDK.initialize(sdkConfig);
```

### Note

<p>For additional user details , make a map and pass it in setUserAdditionalDetails function.</p>

```dart
    var userAdditonalDetail = Map<String, Object>();
    userAdditonalDetail["phoneNumber"] = 9876453210;
    Trackierfluttersdk.setUserAdditonalDetail(userAdditonalDetail);
```

- The first method is to associate user Id in which
- The second method is to associate user email in which

## <a id="qs-sdk-signing"></a>SDK Signing
```dart
TrackerSDKConfig trackerSDKConfig =
    new TrackerSDKConfig("xx-5865-44fc-8fca-xx", "production");
trackerSDKConfig.setAppSecret("xxx", "xxx-xx");
```

## <a id="qs-track-event"></a>Track Events

<a id="qs-retrieve-event-id"></a>Retrieve Event Id from dashboard
<br></br>
<img width="1725" alt="Screenshot 2021-08-03 at 3 25 55 PM" src="https://user-images.githubusercontent.com/34488320/127996772-5e760e26-addc-499b-a7c6-de3ef2d0288c.png">

### <a id="qs-track-simple-event"></a>Track Simple Event

```dart
    TrackierEvent trackierEvent = new TrackierEvent("eventID");
    trackierEvent.orderId = "orderID";
    trackierEvent.param1 = "param1";
    trackierEvent.param2 = "param2";
    trackierEvent.setEventValue("ev1", "eventValue1");
    trackierEvent.setEventValue("ev2", 1);
    Trackierfluttersdk.trackerEvent(trackierEvent);
```

- Argument in Trackier event class is event Id which you want to call event for.
- You can associate inbuilt params with the event , in-built param list are below:- orderId, currency, currency, param1, param2, param3 ,param4, param5, param6, param7, param8, param9, param10

### <a id="qs-track-event-with-currencey"></a>Track with Currency & Revenue Event

```dart
    TrackierEvent trackierEvent = new TrackierEvent("eventID");
    trackierEvent.revenue = 10.0;
    trackierEvent.currency = "INR";
    trackierEvent.orderId = "orderID";
    trackierEvent.param1 = "param1";
    trackierEvent.param2 = "param2";
    trackierEvent.setEventValue("ev1", "eventValue1");
    trackierEvent.setEventValue("ev2", 1);
    Trackierfluttersdk.trackerEvent(trackierEvent);
```

### <a id="qs-add-custom-parms-event"></a>Add custom params with event

```dart
    var eventCustomParams = Map<String, Object>();
    eventCustomParams.put("customParam1",XXXXX)
    eventCustomParams.put("customParam2",XXXXX)
    event.ev = eventCustomParams
    TrackierSDK.trackEvent(event)
```

- First create a map
- Pass its reference to event.ev param of event
- Pass event reference to trackEvent method of TrackerSDK

## <a id="qs-track-uninstall-android"></a>Track Uninstall for Android

#### Before you begin
* [Install `firebase_core`](https://firebase.flutter.dev/docs/overview) and add the initialization code to your app if you haven't already.
* Add your app to your Firebase project in the [Firebase console](https://console.firebase.google.com/).

#### Add the Analytics SDK to your app

* From the root of your Flutter project, run the following command to install the plugin:
	```sh
	  flutter pub add firebase_analytics
	```
* Once complete, rebuild your Flutter application:
	```sh
	  flutter run
	```
* Once installed, you can access the `firebase_analytics` plugin by importing it in your Dart code:
	```dart
	  import 'package:firebase_analytics/firebase_analytics.dart';
	```
* Create a new Firebase Analytics instance by calling the `instance` getter on `FirebaseAnalytics`:
	```dart
	  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
	```
* Use the `analytics` instance obtained above to set the following user property:
	```dart
	  analytics.setUserProperty(name: "ct_objectId", value: TrackierSDK.getTrackierId());
	``` 

* Adding the above code to your app sets up a common identifier. 
* Set the `app_remove` event as a conversion event in Firebase. 
* Use the Firebase cloud function to send uninstall information to Trackier MMP. 
* You can find the support article [here](https://help.trackier.com/support/solutions/articles/31000162841-android-uninstall-tracking).

## <a id="qs-progaurd-trackier-sdk"></a>Proguard Settings

If your app is using proguard then add these lines to the proguard config file

```
  -keep class com.trackier.sdk.** { *; }
  -keep class com.google.android.gms.common.ConnectionResult {
      int SUCCESS;
  }
  -keep class com.google.android.gms.ads.identifier.AdvertisingIdClient {
      com.google.android.gms.ads.identifier.AdvertisingIdClient$Info getAdvertisingIdInfo(android.content.Context);
  }
  -keep class com.google.android.gms.ads.identifier.AdvertisingIdClient$Info {
      java.lang.String getId();
      boolean isLimitAdTrackingEnabled();
  }
  -keep public class com.android.installreferrer.** { *; }
```
