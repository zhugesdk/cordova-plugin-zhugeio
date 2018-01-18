var exec = require("cordova/exec");


var errorHandle = function(error) {
    console.log(error);
}


module.exports = {
    //print something to the native console
    track: function(eventName, eventProp) {
        exec(null, errorHandle, "Zhugeio", "track", [eventName, eventProp]);
    },

    startTrack: function(eventName) {
        exec(null, errorHandle, "Zhugeio", "startTrack", [eventName]);
    },

    endTrack: function(eventName, eventProp) {
        exec(null, errorHandle, "Zhugeio", "endTrack", [eventName, eventProp]);
    },

    identify: function(uid, userProp) {
        exec(null, errorHandle, "Zhugeio", "identify", [uid, userProp]);
    },

    setUploadURL: function(url, backupURL) {
        exec(null, errorHandle, "Zhugeio", "setUploadURL", [url, backupURL]);
    },

    openLog: function() {
        exec(null, errorHandle, "Zhugeio", "openLog", []);
    },

    openDebug: function() {
        exec(null, errorHandle, "Zhugeio", "openDebug", []);
    }
}
