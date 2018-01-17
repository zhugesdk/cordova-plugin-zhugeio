package com.zhuge.analysis.stat;

import android.text.TextUtils;
import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONObject;

public class Zhugeio extends CordovaPlugin {
	@Override
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext){
        if (TextUtils.isEmpty(action)){
            callbackContext.error("action is empty, error.");
            return false;
        }
        if ("openLog".equals(action)){
            ZhugeSDK.getInstance().openLog();
            callbackContext.success();
            return true;
        }else if ("openDebug".equals(action)){
            ZhugeSDK.getInstance().openDebug();
            return true;
        }
        if (args == null || args.length() == 0){
            callbackContext.error(" args invalid, error.");
            return false;
        }
        String first = args.optString(0);
        if (TextUtils.isEmpty(first)) {
            callbackContext.error("action : "+action+ "  must have args, error.");
            return false;
        }
        if ("track".equals(action)){
            JSONObject prop = args.optJSONObject(1);
            ZhugeSDK.getInstance().track(null,first , prop);
        }else if ("startTrack".equals(action)){
            ZhugeSDK.getInstance().startTrack(first);
        }else if ("endTrack".equals(action)){
            JSONObject prop = args.optJSONObject(1);
            ZhugeSDK.getInstance().endTrack(first,prop);
        }else if ("identify".equals(action)){
            JSONObject prop = args.optJSONObject(1);
            ZhugeSDK.getInstance().identify(null,first,prop);
        }else if ("setUploadURL".equals(action)){
            String second = args.optString(1);
            ZhugeSDK.getInstance().setUploadURL(first,second);
        }else {
            callbackContext.error("action invalid, error.");
            return false;
        }
        callbackContext.success();
        return true;
	}

	@Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        // your init code here
        Log.e("Cordova","zhugeio init");
        ZhugeSDK.getInstance().init(cordova.getContext());
    }
}