//
//  LabelStackView.swift
//  iOSUI_Tests
//
//  Created by Sebastian Diaz Avila on 24-04-20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import iOSUI

class LabelStackViewTests: QuickSpec {
    override func spec() {
        describe("LabelStackView") {
            
            var sut: LabelStackView!
            
            context("When initializer") {
                it("have the spected vertical") {
                    let frame = CGRect(x: 0, y: 0, width: 300, height: 120)
                    sut = LabelStackView(title: "TITULO VERTICAL",
                                         axis: .vertical,
                                         distribution: .fillProportionally,
                                         spacing: 10.0,
                                         frame: frame)
                    let ArrayText = [
                        "First Text",
                        "Second Text",
                        "third Text"
                    ]
                    ArrayText.forEach { text in
                        let label = UILabel(frame: .zero)
                        label.font = UIFont.systemFont(ofSize: 16)
                        label.text = text
                        label.textColor = .white
                        sut.stackView.addArrangedSubview(label)
                    }
                    expect(sut).to(haveValidSnapshot())
                }
                
                it("have the spected horizontal") {
                    let frame = CGRect(x: 0, y: 0, width: 300, height: 70)
                    sut = LabelStackView(title: "TITULO HORIZONTAL",
                                         axis: .horizontal,
                                         distribution: .fillProportionally,
                                         spacing: 10.0,
                                         frame: frame)
                    let ArrayText = [
                        "First Text",
                        "Second Text",
                        "third Text"
                    ]
                    ArrayText.forEach { text in
                        let label = UILabel(frame: .zero)
                        label.font = UIFont.systemFont(ofSize: 16)
                        label.text = text
                        label.textColor = .white
                        sut.stackView.addArrangedSubview(label)
                    }
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}
