import Foundation
import UIKit
import MobileCoreServices
import ManagedSettings
import DeviceActivity


@objc(ScreenTimePlugin) class ScreenTimePlugin: CDVPlugin {
    @objc(startMonitoring:)
    func startMonitoring(command: CDVInvokedUrlCommand) {
        AuthorizationCenter.shared.requestAuthorization { result in
            var pluginResult: CDVPluginResult
            switch result {
            case .success:
                // Success case: log and send a success result back to Cordova
                print("Authorization successful")
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Authorization successful")
            case .failure(let error):
                // Failure case: log error and send an error result back to Cordova
                print("Authorization failed with error: \(error)")
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Authorization failed: \(error)")
            }
            self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
        }
        
        // Observing authorization status changes, if necessary, can be complex in a Cordova plugin context.
        // This often requires a more persistent observation mechanism or event dispatching to JavaScript.
        // For simplicity, this initial integration focuses on the direct request/response cycle.
    }
}
