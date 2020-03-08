//
//  DispatcherStore.swift
//  FluxDispatcherWithSwift
//
//  Created by iniad on 2020/03/08.
//  Copyright © 2020 haruta-yamada. All rights reserved.
//

import Foundation

public protocol DispatcherStoreProtocol: class, DispatcherProtocol {
    var store: [String: (Action)->Void] { get set }
}

public extension DispatcherStoreProtocol {
    func on(action: Action) {
        store.forEach { (key, value) in
            value(action)
        }
    }
    func subscribe(callback: @escaping (Action)->Void) -> String {
        let uuid = UUID().uuidString
        store.updateValue(callback, forKey: uuid)
        return uuid
    }
    func unSubscribe(token: String) {
        store[token] = nil
    }
}
