//
//  TwoLineViewTests.swift
//  iOSUI_Example
//
//  Created by Sebastian Diaz Avila on 27-04-20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import iOSUI

class TwoLineViewTests: QuickSpec {
    override func spec() {
        describe("TwoLineView"){
            
            var sut: TwoLineView!
            
            context("when initilized"){
                it("have the spected layout"){
                    let title = "Titulo de la vista"
                    let description = "Lorem ipsum dolor sit amet consectetur adipiscing elit taciti mauris sollicitudin metus nostra, venenatis magnis erat potenti curabitur fames sapien netus ornare aliquam parturient. Imperdiet morbi rutrum rhoncus per dictumst maecenas diam interdum neque commodo pellentesque, scelerisque in volutpat facilisi donec ligula "
                    let frame = CGRect(x: 0, y: 0, width: 300, height: 210)
                    
                    sut = TwoLineView(title: title, description: description, frame: frame)
                    expect(sut).to(haveValidSnapshot())
                    
                }
                
                it("have the spected layout with less description"){
                    let title = "Titulo de la vista"
                    let description = "Lorem ipsum dolor sit sapien netus"
                    let frame = CGRect(x: 0, y: 0, width: 300, height: 60)
                    
                    sut = TwoLineView(title: title, description: description, frame: frame)
                    expect(sut).to(haveValidSnapshot())
                    
                }
            }
        }
    }
}
