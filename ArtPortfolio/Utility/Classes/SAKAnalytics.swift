//
//  SAKAnalytics.swift
//
//  Created by Susan Kern on 7/16/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import Crashlytics

class SAKAnalytics {
    
    static func logContentView(name: String, fullScreen: Bool) {
        Answers.logContentView(withName: name,
                               contentType: fullScreen ? "Artwork full-screen view" : "Artwork view",
                               contentId: nil,
                               customAttributes: nil)
    }
}
