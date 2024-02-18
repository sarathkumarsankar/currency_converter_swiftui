//
//  CurrencyConverterTests.swift
//  CurrencyConverterTests
//
//  Created by sa20199164 on 16/02/2024.
//

import XCTest
import CurrencyConverter

final class CurrencyConverterTests: XCTestCase {
    var viewModel: CurrencyConverterViewModel!
    override func setUpWithError() throws {
        viewModel = CurrencyConverterViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func testHelloWorld() {
        XCTAssertEqual(viewModel.addition(first: 2, second: 2), 4)
    }

 

}
