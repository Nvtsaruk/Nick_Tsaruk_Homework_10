//
//  Observable.swift
//  Nick_Tsaruk_Homework_10
//
//  Created by Tsaruk Nick on 22.07.23.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
