//
//  SAKSocialLinks.swift
//
//  Created by Susan Kern on 7/18/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

class SAKSocialLinks {
    
    func openInstagram(username: String) {
        let appURL = NSURL(string: "instagram://user?username=\(username)")!
        let webURL = NSURL(string: "https://instagram.com/\(username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
}
