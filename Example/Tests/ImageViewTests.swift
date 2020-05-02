//
//  ImageViewTests.swift
//  iOSUI_Tests
//
//  Created by ITAU on 30-04-20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import iOSUI

class ImageViewTests: QuickSpec {

    override func spec() {
        describe("ImageView") {
            context("when initilized") {
                it("have the spected layout") {
                    let frame = CGRect(x: 0, y: 0, width: 250, height: 300)
                    let view = ImageView(frame: frame)
                    if let path = Bundle(for: type(of: self)).path(forResource: "picture", ofType: ".jpg"),
                        let image = UIImage(contentsOfFile: path){
                        view.updateImage(image: image)
                    }
                    expect(view).to(haveValidSnapshot())
                }
            }
        }
    }

}
