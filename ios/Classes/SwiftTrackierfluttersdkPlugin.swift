import Flutter
import UIKit
import trackier_ios_sdk

public class SwiftTrackierfluttersdkPlugin: NSObject, FlutterPlugin, DeepLinkListener {
	
	private var channel: FlutterMethodChannel
	
	private init(channel: FlutterMethodChannel) {
		self.channel = channel
	}
	
	public func onDeepLinking(result: trackier_ios_sdk.DeepLink) {
		var dict = Dictionary<String, Any>()
		dict["uri"] = result.getUrl()
		self.channel.invokeMethod("deferred-deeplink", arguments: dict)
	}
	
	public static func register(with registrar: FlutterPluginRegistrar) {
		let channel = FlutterMethodChannel(name: "trackierfluttersdk", binaryMessenger: registrar.messenger())
		let instance = SwiftTrackierfluttersdkPlugin(channel: channel)
		registrar.addMethodCallDelegate(instance, channel: channel)
	}
	
	public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
		//result("iOS " + UIDevice.current.systemVersion)
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
			} else if (call.method == "setDOB") {
				let dict = call.arguments as? String
				if (dict != nil) { setDOB(dict: dict!) }
			} else if (call.method == "setGender") {
				let dict = call.arguments as? String
				if (dict != nil) { setGender(dict: dict!) }
			} else if (call.method == "setUserAdditonalDetail") {
				let dict = call.arguments as? [String:Any]
				if (dict != nil) { setUserAdditionalDetails(dict: dict!) }
			} else if (call.method == "updatePostbackConversion") {
				let dict = call.arguments as? Int
				if (dict != nil) { updatePostbackConversion(dict: dict!) }
			} else if (call.method == "parseDeeplink") {
				let dict = call.arguments as? String
				if (dict != nil) { parseDeeplink(dict: dict!) }
			} else if (call.method == "initializeSDK") {
				let dict = call.arguments as? [String:Any]
				if (dict != nil) { initializeSDK(dict: dict) }
			} else if (call.method == "trackierEvent") {
				let dict = call.arguments as? [String:Any]
				if (dict != nil) { trackEvent(dict: dict) }
			} else if (call.method == "getAd") {
				getAd(result: result)
			} else if (call.method == "getAdID") {
				getAdID(result: result)
			} else if (call.method == "getAdSet") {
				getAdSet(result: result)
			} else if (call.method == "getAdSetID") {
				getAdSetID(result: result)
			} else if (call.method == "getCampaign") {
				getCampaign(result: result)
			} else if (call.method == "getCampaignID") {
				getCampaignID(result: result)
			} else if (call.method == "getP1") {
				getP1(result: result)
			} else if (call.method == "getP2") {
				getP2(result: result)
			} else if (call.method == "getP3") {
				getP3(result: result)
			} else if (call.method == "getP4") {
				getP4(result: result)
			} else if (call.method == "getP5") {
				getP5(result: result)
			} else if (call.method == "getClickId") {
				getClickId(result: result)
			} else if (call.method == "getDlv") {
				getDlv(result: result)
			} else if (call.method == "getPid") {
				getPid(result: result)
			} else if (call.method == "getIsRetargeting") {
				getIsRetargeting(result: result)
			} else if (call.method == "getTrackierId") {
				getTrackierId(result: result)
			} else {
				result(FlutterMethodNotImplemented)
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
	
	func setDOB(dict: String) -> Void {
		let dob = dict
		TrackierSDK.setDOB(dob: dob)
	}
	
	func setGender(dict: String) -> Void {
		let gender = dict
		switch gender {
		case "Gender.Male": TrackierSDK.setGender(gender: .MALE)
		case "Gender.Female": TrackierSDK.setGender(gender: .FEMALE)
		case "Gender.Others": TrackierSDK.setGender(gender: .OTHERS)
		default: print("No Gender found")
		}
	}
	
	func setUserAdditionalDetails(dict: Dictionary<String, Any>) -> Void {
		let userAdditionalDetails = dict
		TrackierSDK.setUserAdditionalDetails(userAdditionalDetails: userAdditionalDetails);
	}
	
	func updatePostbackConversion(dict: Int) -> Void {
		let postbackConversion = dict
		TrackierSDK.updatePostbackConversion(conversionValue: postbackConversion)
	}
	
	func parseDeeplink(dict: String) -> Void {
		let parseDeeplinkUrl = dict
		TrackierSDK.parseDeepLink(uri: parseDeeplinkUrl)
	}
	
	func getAd(result: FlutterResult) -> Void {
		result(TrackierSDK.getAd())
	}
	
	func getAdID(result: FlutterResult) -> Void {
		result(TrackierSDK.getAdID())
	}
	
	func getAdSet(result: FlutterResult) -> Void {
		result(TrackierSDK.getAdSet())
	}
	
	func getAdSetID(result: FlutterResult) -> Void {
		result(TrackierSDK.getAdSetID())
	}
	
	func getCampaign(result: FlutterResult) -> Void {
		result(TrackierSDK.getCampaign())
	}
	
	func getCampaignID(result: FlutterResult) -> Void {
		result(TrackierSDK.getCampaignID())
	}
	
	func getChannel(result: FlutterResult) -> Void {
		result(TrackierSDK.getChannel())
	}
	
	func getP1(result: FlutterResult) -> Void {
		result(TrackierSDK.getP1())
	}
	
	func getP2(result: FlutterResult) -> Void {
		result(TrackierSDK.getP2())
	}
	
	func getP3(result: FlutterResult) -> Void {
		result(TrackierSDK.getP3())
	}
	
	func getP4(result: FlutterResult) -> Void {
		result(TrackierSDK.getP4())
	}
	
	func getP5(result: FlutterResult) -> Void {
		result(TrackierSDK.getP5())
	}
	
	func getClickId(result: FlutterResult) -> Void {
		result(TrackierSDK.getClickId())
	}
	
	func getDlv(result: FlutterResult) -> Void {
		result(TrackierSDK.getDlv())
	}
	
	func getPid(result: FlutterResult) -> Void {
		result(TrackierSDK.getPid())
	}
	
	func getIsRetargeting(result: FlutterResult) -> Void {
		result(TrackierSDK.getIsRetargeting())
	}
	
	func getTrackierId(result: FlutterResult) -> Void {
		result(TrackierSDK.getTrackierId())
	}
	
	func initializeSDK(dict: Optional<Dictionary<String, Any>>) -> Void {
		let appToken = "\(dict?["appToken"] as? String ?? "")"
		let environment = "\(dict?["environment"] as? String ?? "")"
		let secretId = "\(dict?["secretId"] as? String ?? "")"
		let secretKey = "\(dict?["secretKey"] as? String ?? "")"
		let deeplinkKey = "\(dict?["deeplinkCallback"] as? String ?? "")"
		let config = TrackierSDKConfig(appToken: appToken , env: environment)
		config.setAppSecret(secretId: secretId, secretKey: secretKey)
		config.setSDKVersion(sdkVersion: "1.6.57")
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



