//
//  Queue.swift
//  
//
//  Created by Douglas MacbookPro on 9/16/17.
//
// Credit: https://www.raywenderlich.com/148141/swift-algorithm-club-swift-queue-data-structure

import Foundation

public struct Queue<T> {
    
    fileprivate var list = LinkedList<T>()
    
    public mutating func add(_ element: T) {
        list.append(element)
    }
    
    public mutating func remove() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        
        list.remove(element)
        
        return element.value
    }
    
    public func peek() -> T? {
        return list.first?.value
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
}

extension Queue: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        return list.description
    }
}
