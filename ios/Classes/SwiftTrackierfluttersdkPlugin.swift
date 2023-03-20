import Flutter
import UIKit
import trackier_ios_sdk

public class SwiftTrackierfluttersdkPlugin: NSObject, FlutterPlugin, DeepLinkListener {
    
    static var channel = FlutterMethodChannel()
    
    public func onDeepLinking(result: trackier_ios_sdk.DeepLink) {
        var dict = Dictionary<String, Any>()
        dict["uri"] = result.getUrlParams()
        SwiftTrackierfluttersdkPlugin.channel.invokeMethod("deferred-deeplink", arguments: dict)
    }
    
	public static func register(with registrar: FlutterPluginRegistrar) {
		channel = FlutterMethodChannel(name: "trackierfluttersdk", binaryMessenger: registrar.messenger())
		let instance = SwiftTrackierfluttersdkPlugin()
		registrar.addMethodCallDelegate(instance, channel: channel)
	}
	
	public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
		result("iOS " + UIDevice.current.systemVersion)
		if (call.method == "setUserId") {
			let dict = call.arguments as? String
			if (dict != nil) { setUserId(dict: dict!) }
		} else if (call.method == "setUserEmail") {
			let dict = call.arguments as? String
			if (dict != nil) { setUserEmail(dict: dict!) }
		} else if (call.method == "setUserPhone") {
			let dict = call.arguments as? String
			if (dict != nil) { setUserPhone(dict: dict!) }
		} else if (call.method == "setUserName") {
			let dict = call.arguments as? String
			if (dict != nil) { setUserName(dict: dict!) }
		} else if (call.method == "setUserAdditonalDetail") {
			let dict = call.arguments as? [String:Any]
			if (dict != nil) { setUserAdditionalDetails(dict: dict!) }
		} else if (call.method == "initializeSDK") {
			let dict = call.arguments as? [String:Any]
			if (dict != nil) { initializeSDK(dict: dict) }
		} else if (call.method == "trackierEvent") {
			let dict = call.arguments as? [String:Any]
			if (dict != nil) { trackEvent(dict: dict) }
		}
	}
	
	func setUserId(dict: String) -> Void {
		let userId = dict
		TrackierSDK.setUserID(userId: userId)
	}
	
	func setUserEmail(dict: String) -> Void {
		let userEmail = dict
		TrackierSDK.setUserEmail(userEmail: userEmail);
	}

	func setUserPhone(dict: String) -> Void {
		let userPhone = dict
		TrackierSDK.setUserPhone(userPhone: userPhone);
	}

	func setUserName(dict: String) -> Void {
		let userName = dict
		TrackierSDK.setUserName(userName: userName);
	}
	
	func setUserAdditionalDetails(dict: Dictionary<String, Any>) -> Void {
		let userAdditionalDetails = dict
		TrackierSDK.setUserAdditionalDetails(userAdditionalDetails: userAdditionalDetails);
	}
	
	func initializeSDK(dict: Optional<Dictionary<String, Any>>) -> Void {
		let appToken = "\(dict?["appToken"] as? String ?? "")"
		let environment = "\(dict?["environment"] as? String ?? "")"
		let secretId = "\(dict?["secretId"] as? String ?? "")"
		let secretKey = "\(dict?["secretKey"] as? String ?? "")"
        let deeplinkKey = "\(dict?["deeplinkCallback"] as? String ?? "")"
		let config = TrackierSDKConfig(appToken: appToken , env: environment)
		config.setAppSecret(secretId: secretId, secretKey: secretKey)
		config.setSDKVersion(sdkVersion: "1.6.33")
        if (!deeplinkKey.isEmpty) {
            config.setDeeplinkListerner(listener: self)
        }
		TrackierSDK.initialize(config: config)
	}
	
	func trackEvent(dict: Optional<Dictionary<String, Any>>) -> Void {
		let eventId: String = "\(dict?["eventId"] as? String ?? "")"
		let currency: String = "\(dict?["currency"] as? String ?? "")"
		let revenue: Float64 = (dict?["revenue"] as? Float64 ?? 0.0)
		let orderId: String = "\(dict?["orderId"] as? String ?? "")"
		let discount: Float64 = (dict?["discount"] as? Float64 ?? 0.0)
		let couponCode: String = "\(dict?["couponCode"] as? String ?? "")"
		let param1: String = "\(dict?["param1"] as? String ?? "")"
		let param2: String = "\(dict?["param2"] as? String ?? "")"
		let param3: String = "\(dict?["param3"] as? String ?? "")"
		let param4: String = "\(dict?["param4"] as? String ?? "")"
		let param5: String = "\(dict?["param5"] as? String ?? "")"
		let param6: String = "\(dict?["param6"] as? String ?? "")"
		let param7: String = "\(dict?["param7"] as? String ?? "")"
		let param8: String = "\(dict?["param8"] as? String ?? "")"
		let param9: String = "\(dict?["param9"] as? String ?? "")"
		let param10: String = "\(dict?["param10"] as? String ?? "")"
		var ev:Dictionary<String,Any> = dict ?? [:]
		
		for (key, value) in ev {
			ev[key] = value
		}
		
		let event = TrackierEvent(id: eventId)
		event.setRevenue(revenue: Float64(revenue), currency: currency)
		event.orderId = orderId
		event.setCouponCode(couponCode: couponCode)
		event.setDiscount(discount: Float64(discount))
		event.param1  = param1
		event.param2  = param2
		event.param3  = param3
		event.param4  = param4
		event.param5  = param5
		event.param6  = param6
		event.param7  = param7
		event.param8  = param8
		event.param9  = param9
		event.param10 = param10
		for (key, value) in ev {
			event.addEventValue(prop: key, val: value)
		}
		TrackierSDK.trackEvent(event: event)
	}
}



