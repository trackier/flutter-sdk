import Flutter
import UIKit
import trackier_ios_sdk

public class SwiftTrackierfluttersdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "trackierfluttersdk", binaryMessenger: registrar.messenger())
    let instance = SwiftTrackierfluttersdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
    
    //print(call.method)
    if(call.method == "initializeSDK"){
        let dict = call.arguments as? [String:Any]
        initializeSDK(dict: dict)
        }
        
    }
    
  }

    func initializeSDK(dict: Optional<Dictionary<String, Any>>) -> Void {
            let appToken = "\(dict?["appToken"] as? String ?? "")"
            let environment = "\(dict?["environment"] as? String ?? "")"
            print("type of dict: ",type(of:dict))
            print("appToken: ",appToken)
            print("appToken: ",appToken)
            let config = TrackierSDKConfig(appToken: appToken , env: environment)
            TrackierSDK.initialize(config: config)

	}

	 func trackEvent(_ dict: NSDictionary) -> Void {

		let currency: String = dict["currency"] as? String ?? ""
		let revenue: String = dict["revenue"] as? String ?? ""
		let eventId: String = dict["eventId"] as! String
		let orderId: String = dict["orderId"] as? String ?? ""
		let param1: String = dict["param1"] as? String ?? ""
		let param2: String = dict["param2"] as? String ?? ""
		let param3: String = dict["param3"] as? String ?? ""
		let param4: String = dict["param4"] as? String ?? ""
		let param5: String = dict["param5"] as? String ?? ""
		let param6: String = dict["param6"] as? String ?? ""
		let param7: String = dict["param7"] as? String ?? ""
		let param8: String = dict["param8"] as? String ?? ""
		let param9: String = dict["param9"] as? String ?? ""
		let param10: String = dict["param10"] as? String ?? ""
		var ev:Dictionary<String,Any> = dict["ev"] as? Dictionary<String,Any> ?? [:]

		for (key, value) in ev {
			ev[key] = value
		}

		let event = TrackierEvent(id: eventId)
		event.setRevenue(revenue: Float64((revenue as NSString).floatValue), currency: currency)
		event.orderId = orderId
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



