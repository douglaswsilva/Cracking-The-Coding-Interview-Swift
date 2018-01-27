// Queue via stacks: Implement a MyQueue class which implements a queue usign two stacks.

import UIKit

import UIKit

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

struct MyQueue<Element> {
    fileprivate var pushStack = Stack<Element>()
    fileprivate var popStack =  Stack<Element>()
    
    mutating func push(_ element: Element) {
        while !popStack.isEmpty {
            if let elem = popStack.pop() {
                pushStack.push(elem)
            }
        }
        
        pushStack.push(element)
    }
    
    mutating func pop() -> Element? {
        while !pushStack.isEmpty {
            if let elem =  pushStack.pop() {
                popStack.push(elem)
            }
        }
        
        return popStack.pop()
    }
    
    mutating func peek() -> Element? {
        while !pushStack.isEmpty {
            if let elem =  pushStack.pop() {
                popStack.push(elem)
            }
        }
        
        return popStack.peek()
    }
    
    var isEmpty: Bool {
        return popStack.isEmpty && pushStack.isEmpty
    }
    
    var count: Int {
        return popStack.count + pushStack.count
    }
}

var mine = MyQueue<String>()

mine.push("A")
mine.push("B")
mine.push("C")
mine.push("D")

print(mine.pop())
