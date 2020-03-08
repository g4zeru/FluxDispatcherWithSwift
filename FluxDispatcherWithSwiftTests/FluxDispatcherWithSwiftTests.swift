//
//  FluxDispatcherWithSwiftTests.swift
//  FluxDispatcherWithSwiftTests
//
//  Created by iniad on 2020/03/08.
//  Copyright © 2020 haruta-yamada. All rights reserved.
//

import XCTest
@testable import FluxWithSwift

class FluxWithSwiftTests: XCTestCase {

    func testSubscribe() {
        let dispatcher = MockDispatcher()
        let store = MockStore(dispatcher: dispatcher)
        XCTAssertEqual(store.count, 0)
        dispatcher.on(action: .increment)
        dispatcher.on(action: .increment)
        XCTAssertEqual(store.count, 2)
        dispatcher.on(action: .decrement)
        XCTAssertEqual(store.count, 1)
    }
    
    func testUnsubscribe() {
        let dispatcher = MockDispatcher()
        let store = MockStore(dispatcher: dispatcher)
        XCTAssertEqual(dispatcher.store.count, 1)
        store.unsubscribe()
        XCTAssertEqual(dispatcher.store.count, 0)
    }
}
