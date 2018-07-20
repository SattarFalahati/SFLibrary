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
}
