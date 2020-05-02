//
//  ScoreViewTests.swift
//  iOSUI_Tests
//
//  Created by ITAU on 02-05-20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import iOSUI

class ScoreViewTests: QuickSpec {

    override func spec() {
        describe("ScoreView") {
            context("when initilized") {
                it("have the spected layout") {
                    let frame = CGRect(x: 0, y: 0, width: 300, height: 60)
                    let view = ScoreView(title: "popularity", score: "34.5", frame: frame)
                    expect(view).to(haveValidSnapshot())
                }

                it("have the spected layout with large title") {
                    let frame = CGRect(x: 0, y: 0, width: 300, height: 120)
                    let view = ScoreView(title: "popularity of movie in the last year's (number o visit in the theater)", score: "34.5", frame: frame)
                    expect(view).to(haveValidSnapshot())
                }
            }
        }
    }

}

