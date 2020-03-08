//
//  Dispatcher.swift
//  FluxDispatcherWithSwift
//
//  Created by iniad on 2020/03/08.
//  Copyright © 2020 haruta-yamada. All rights reserved.
//

import Foundation

public protocol DispatcherProtocol {
    associatedtype Action
    func on(action: Action)
    func subscribe(callback: @escaping (Action)->Void) -> String
    func unSubscribe(token: String)
}
