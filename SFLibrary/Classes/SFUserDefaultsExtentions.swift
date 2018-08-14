//
//  SFUserDefaultsExtentions.swift
//  Pods
//
//  Created by sattar.falahati on 29/03/18.
//

import Foundation

extension UserDefaults
{
    /// check for is the first launch - only true on first invocation after app install, false on all further invocations
    public static func isFirstLaunchApp() -> Bool
    {
        let hasBeenLaunchedBeforeFlag = "hasBeenLaunchedBeforeFlag"
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: hasBeenLaunchedBeforeFlag)
        if (isFirstLaunch) {
            UserDefaults.standard.set(true, forKey: hasBeenLaunchedBeforeFlag)
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }
    
    // MARK: Use it to show what's new in this version
    
   public func hasAppBeenUpdatedSinceLastRun() -> Bool
    {
        // Get app version
        var bundleInfo = Bundle.main.infoDictionary!
        if let currentVersion = bundleInfo["CFBundleShortVersionString"] as? String {
            let userDefaults = UserDefaults.standard
            
            // If app version is not changed means that app hasen't been updated.
            if userDefaults.string(forKey: "currentVersion") == (currentVersion) {
                return false
            }
            
            // Save the version
            userDefaults.set(currentVersion, forKey: "currentVersion")
            userDefaults.synchronize()

            // If app never been lunched before, means it's first downlod
            if UserDefaults.isFirstLaunchApp() {
                return false
            }
            
            return true
        }
        return false;
    }
}




