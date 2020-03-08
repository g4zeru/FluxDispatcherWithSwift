//
//  Resource.swift
//  FluxWithSwiftTests
//
//  Created by iniad on 2020/03/08.
//  Copyright © 2020 haruta-yamada. All rights reserved.
//

import FluxWithSwift

class MockDispatcher: DispatcherStoreProtocol {
    enum Action {
        case increment
        case decrement
    }
    var store: [String : ((MockDispatcher.Action) -> Void)] = [:]
    static let instance = MockDispatcher()
    
    deinit {
        print("MockDispatcher called deinit")
    }
}

class MockStore {
    private var token: String?
    private let dispatcher: MockDispatcher
    var count: Int = 0

    deinit {
        unsubscribe()
        print("MockStore called deinit")
    }
    init(dispatcher: MockDispatcher) {
        self.dispatcher = dispatcher
        self.token = dispatcher.subscribe(callback: { [weak self] action in
            switch action {
            case .increment:
                self?.count += 1
            case .decrement:
                self?.count -= 1
            }
        })
    }
    
    func unsubscribe() {
        if let token = self.token {
            dispatcher.unSubscribe(token: token)
        }
    }
}

