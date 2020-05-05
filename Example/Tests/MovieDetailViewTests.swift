//
//  MovieDetailViewTests.swift
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

class MovieDetailViewsTests: QuickSpec {

    override func spec() {
        describe("MovieDetailViews") {
            context("when initilized") {

                var sut: MovieDetailView!

                it("have the spected layout") {
                    if let path = Bundle(for: type(of: self)).path(forResource: "picture", ofType: ".jpg"),
                        let image = UIImage(contentsOfFile: path){
                        sut = MovieDetailView(title: "TITULO", image: image, frame: .zero)
                    }
                    expect(sut).to(haveValidDynamicSizeSnapshot(sizes: Device.sizes))
                }
            }
        }
    }

}
