//
//  CustomAsserts.swift
//  TestMediaSearchTests
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import XCTest

func assertMethodCall(_ methodCall: Bool, file: StaticString = #file, line: UInt = #line) {
    if !methodCall {
        XCTFail("Expected method wasn't called", file: file, line: line)
    }
}

func assertMethodNotCall(_ methodCall: Bool, file: StaticString = #file, line: UInt = #line) {
    if methodCall {
        XCTFail("Expected method was called", file: file, line: line)
    }
}
