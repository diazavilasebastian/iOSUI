//
//  Sizes.swift
//  iOSUI_Tests
//
//  Created by ITAU on 04-05-20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//
import Foundation
import UIKit

class Device {

    /*
     UIKIT POINTS
            iPhone X                            375 x 812
            iPhone 8 Plus                       414 x 736
            iPhone 8                            375 x 667
            iPhone SE                           320 x 568
            iphone 11                           414 x 896
     */

    static let sizes = [
        "iPhone X": CGSize(width:  375, height: 812),
        "iPhone 8 Plus": CGSize(width:  414, height: 736),
        "iPhone 8": CGSize(width:  375, height: 667),
        "iPhone SE": CGSize(width:  320, height: 568),
        "iphone 11": CGSize(width:  414, height: 896),
    ]
}
