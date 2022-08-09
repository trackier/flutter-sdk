package com.example.trackierfluttersdk

import android.app.Application
import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import com.trackier.sdk.TrackierEvent
import com.trackier.sdk.TrackierSDK
import com.trackier.sdk.TrackierSDKConfig
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** TrackierfluttersdkPlugin */
class TrackierfluttersdkPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context : Context
    private lateinit var trackierSDKConfig: TrackierSDKConfig

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "trackierfluttersdk")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "setUserId" -> {
              setUserId(call, result);
            }

            "setUserEmail" -> {
              setUserEmail(call, result);
            }

            "setUserAdditonalDetail" -> {
               setUserAdditonalDetail(call, result);
            }

            "initializeSDK" -> {
                initializeSDK(call, result)
            }

            "trackierEvent" -> {
                trackEvent(call, result)
            }

            "getTrackierId" -> {
                getTrackierId(call, result)
            }

            "setUserName" -> {
                setUserName(call, result)
            }

            "setUserPhone" -> {
                setUserPhone(call, result)
            }
        }
    }

    private fun initializeSDK(call: MethodCall, result: Result) {
        var appToken = ""
        var environment = ""
        var secretId = ""
        var secretKey = ""
        val configMap = call.arguments as MutableMap<*, *>
        
        if (configMap.containsKey("appToken")) {
            appToken = configMap.get("appToken") as String
        }

        if (configMap.containsKey("secretId")) {
            secretId = configMap.get("secretId") as String
        }

        if (configMap.containsKey("secretKey")) {
            secretKey = configMap.get("secretKey") as String
        }

        if (configMap.containsKey("environment")) {
            environment = configMap.get("environment") as String
        }
        trackierSDKConfig = TrackierSDKConfig(context, appToken, environment)
        trackierSDKConfig.setSDKVersion("1.6.29")
        trackierSDKConfig.setSDKType("flutter_sdk")
        trackierSDKConfig.setAppSecret(secretId, secretKey)
        TrackierSDK.initialize(trackierSDKConfig)
    }

    private fun setUserId(call: MethodCall, result: Result) {
        val userId = call.arguments as String
        TrackierSDK.setUserId(userId)
    }

    private fun setUserEmail(call: MethodCall, result: Result) {
        val userEmail = call.arguments as String
        TrackierSDK.setUserEmail(userEmail)
    }

    private fun setUserName(call: MethodCall, result: Result) {
        val userName = call.arguments as String
        TrackierSDK.setUserName(userName)
    }

    private fun setUserPhone(call: MethodCall, result: Result) {
        val userPhone = call.arguments as String
        TrackierSDK.setUserPhone(userPhone)
    }

   private fun setUserAdditonalDetail(call: MethodCall, result: Result) {
       var userAddtionalDetail:MutableMap<String,Any> = mutableMapOf()
       val configMap = call.arguments as MutableMap<*, *>
        if (configMap.containsKey("userAddtionalDetail")) {
            userAddtionalDetail = configMap.get("userAddtionalDetail") as MutableMap<String,Any>
        }
       TrackierSDK.setUserAdditionalDetails(userAddtionalDetail)
    }


    private fun trackEvent(call: MethodCall, result: Result) {
        var eventId: String? = null
        var orderId: String? = null
        var currency: String? = null
        var discount: Double? = null
        var couponCode: String? = null
        var param1: String? = null
        var param2: String? = null
        var param3: String? = null
        var param4: String? = null
        var param5: String? = null
        var param6: String? = null
        var param7: String? = null
        var param8: String? = null
        var param9: String? = null
        var param10: String? = null
        var revenue: Double? = null
        var ev = mutableMapOf<String, Any>()
        lateinit var trackierEvent: TrackierEvent

        val configMap = call.arguments as MutableMap<*, *>

        if (configMap.containsKey("eventId")) {
            eventId = configMap.get("eventId") as String
            trackierEvent = TrackierEvent(eventId)
        }
        if (configMap.containsKey("orderId")) {
            orderId = configMap.get("orderId") as String
            trackierEvent.orderId = orderId
        }
        if (configMap.containsKey("revenue")) {
            revenue = configMap.get("revenue") as Double
            trackierEvent.revenue = revenue
        }
        if (configMap.containsKey("currency")) {
            currency = configMap.get("currency") as String
            trackierEvent.currency = currency
        }
        if (configMap.containsKey("discount")) {
            discount = configMap.get("discount") as Double
            trackierEvent.discount = discount.toFloat()
        }
        if (configMap.containsKey("couponCode")) {
            couponCode = configMap.get("couponCode") as String
            trackierEvent.couponCode = couponCode
        }
        if (configMap.containsKey("param1")) {
            param1 = configMap.get("param1") as String
            trackierEvent.param1 = param1
        }
        if (configMap.containsKey("param2")) {
            param2 = configMap.get("param2") as String
            trackierEvent.param2 = param2
        }
        if (configMap.containsKey("param3")) {
            param3 = configMap.get("param3") as String
            trackierEvent.param3 = param3
        }
        if (configMap.containsKey("param4")) {
            param4 = configMap.get("param4") as String
            trackierEvent.param4 = param4
        }
        if (configMap.containsKey("param5")) {
            param5 = configMap.get("param5") as String
            trackierEvent.param5 = param5
        }
        if (configMap.containsKey("param6")) {
            param6 = configMap.get("param6") as String
            trackierEvent.param6 = param6
        }
        if (configMap.containsKey("param7")) {
            param7 = configMap.get("param7") as String
            trackierEvent.param7 = param7
        }
        if (configMap.containsKey("param8")) {
            param8 = configMap.get("param8") as String
            trackierEvent.param8 = param8
        }
        if (configMap.containsKey("param9")) {
            param9 = configMap.get("param9") as String
            trackierEvent.param9 = param9
        }
        if (configMap.containsKey("param10")) {
            param10 = configMap.get("param10") as String
            trackierEvent.param10 = param10
        }
        if (configMap.containsKey("ev")) {
            ev = configMap.get("ev") as MutableMap<String, Any>
            trackierEvent.ev = ev
        }

        Log.d("com.trackier.flutter", "eventId: " + eventId)
        Log.d("com.trackier.flutter", "orderId: " + orderId)
        Log.d("com.trackier.flutter", "revenue: " + revenue)
        Log.d("com.trackier.flutter", "currency: " + currency)
        Log.d("com.trackier.flutter", "param1: " + param1)
        Log.d("com.trackier.flutter", "param2: " + param2)
        Log.d("com.trackier.flutter", "param3: " + param3)
        Log.d("com.trackier.flutter", "param4: " + param4)
        Log.d("com.trackier.flutter", "param5: " + param5)
        Log.d("com.trackier.flutter", "param6: " + param6)
        Log.d("com.trackier.flutter", "param7: " + param7)
        Log.d("com.trackier.flutter", "param8: " + param8)
        Log.d("com.trackier.flutter", "param9: " + param9)
        Log.d("com.trackier.flutter", "param10: " + param10)
        Log.d("com.trackier.flutter", "ev: " + ev.toString())

        TrackierSDK.trackEvent(trackierEvent)
    }

    private fun getTrackierId(call: MethodCall, result: Result) {
        val installID = TrackierSDK.getTrackierId()
        result.success(installID)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}