//
//  Stack.swift
//  
//
//  Created by Douglas MacbookPro on 9/16/17.
//
// Credit: https://www.raywenderlich.com/149213/swift-algorithm-club-swift-stack-data-structure

import Foundation

struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
}

extension Stack: CustomStringConvertible {
    // 2
    var description: String {
        // 3
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        // 4
        let stackElements = array.map { "\($0)" }.reversed().joined(separator: "\n")
        // 5
        return topDivider + stackElements + bottomDivider
    }
}
