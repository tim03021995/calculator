//
//  myCalculatorTests.swift
//  myCalculatorTests
//
//  Created by Alvin Tseng on 2020/6/8.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import XCTest
@testable import myCalculator

class myCalculatorTests: XCTestCase {
    
    //
    func test_5加5等於()  {
        var info = Infix()
        info.input("5")
        info.input("+")
        info.input("5")
        info.input("+")
        XCTAssertEqual(info.viewDisplay(), "10")
    }
    func test_5加5()  {
        var info = Infix()
        info.input("5")
        info.input("+")
        info.input("5")
        XCTAssertEqual(info.viewDisplay(), "5")
    }
    func testInput10() {
        var info = Infix()
        info.input("1")
        info.input("0")
        XCTAssertEqual(info.viewDisplay(), "10")
    }
    func test_負1乘5等於() {
        var info = Infix()
        info.input("-")
        info.input("1")
        info.input("*")
        info.input("5")
        info.input("=")
        XCTAssertEqual(info.viewDisplay(), "-5")
    }
    func test_負1等於() {
        var info = Infix()
        info.input("-")
        info.input("1")
        info.input("=")
        XCTAssertEqual(info.viewDisplay(), "-1")
    }
    func test_十除以零等於() {
        var info = Infix()
        info.input("1")
        info.input("0")
        info.input("/")
        info.input("0")
        info.input("=")
        XCTAssertEqual(info.viewDisplay(), "無窮")    }
    func test_一剪剪三等於() {
        var info = Infix()
        info.input("1")
        info.input("-")
        info.input("-")
        info.input("3")
        info.input("=")
        XCTAssertEqual(info.viewDisplay(), "-2")
    }
    func test_等於按了四次() {
        var info = Infix()
        info.input("1")
        info.input("+")
        info.input("1")
        info.input("=")
        info.input("=")
        info.input("=")
        info.input("=")
        XCTAssertEqual(info.viewDisplay(), "5")
    }
    func test_等於後的運算() {
        var info = Infix()
        info.input("1")
        info.input("+")
        info.input("1")
        info.input("=")
        info.input("-")
        info.input("1")
        info.input("=")
        XCTAssertEqual(info.viewDisplay(), "1")
    }
    func test_等於後的運算2() {
        var info = Infix()
        info.input("1")
        info.input("+")
        info.input("2")
        info.input("=")
        info.input("*")
        info.input("3")
        info.input("=")
        XCTAssertEqual(info.viewDisplay(), "9")
    }
}

//[]
//for in
//    Info.set
//
//info.get
