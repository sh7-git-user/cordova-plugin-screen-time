var exec = require('cordova/exec');

var ScreenTimePlugin = {
    startMonitoring: function (successCallback, errorCallback) {
        exec(successCallback, errorCallback, "ScreenTimePlugin", "startMonitoring", []);
    }
    // Additional methods as needed
};

module.exports = ScreenTimePlugin;
