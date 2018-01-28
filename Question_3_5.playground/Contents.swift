//: Playground - noun: a place where people can play

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

func sortStackShort(_ s: inout Stack<Int>) {
    var r = Stack<Int>()
    
    s.push(5)
    s.push(2)
    s.push(3)
    s.push(1)
    s.push(4)
    s.push(5)
    s.push(9)
    
    while !s.isEmpty {
        if let tmp = s.pop() {
            while (!r.isEmpty && r.peek()! > tmp) {
                if let a = r.pop() {
                    s.push(a)
                }
            }
            r.push(tmp)
        }
    }
    
    print(r.array)
}

func sortStackLong(_ minStack: inout Stack<Int>) {
    
    var maxStack = Stack<Int>()
    
    maxStack.push(5)
    maxStack.push(2)
    maxStack.push(3)
    maxStack.push(1)
    maxStack.push(4)
    maxStack.push(5)
    maxStack.push(9)
    
    var count = 1
    
    while count > 0 {
        
        count = 0
        
        while !minStack.isEmpty {
            if let a = minStack.pop() {
                maxStack.push(a)
            }
        }
        
        guard var temp = maxStack.pop() else { return }
        
        while !maxStack.isEmpty {
            if let element = maxStack.pop() {
                if element < temp {
                    minStack.push(element)
                } else if element >= temp {
                    minStack.push(temp)
                    temp = element
                }
            }
        }
        
        minStack.push(temp)
        
        guard var temp2 = minStack.pop() else { return }
        
        while !minStack.isEmpty {
            if let element = minStack.pop() {
                if element < temp2 {
                    maxStack.push(temp2)
                    temp2 = element
                } else if element >= temp2 {
                    maxStack.push(element)
                }
            }
        }
        
        maxStack.push(temp2)
        
        while !maxStack.isEmpty {
            if let a = maxStack.pop() {
                if let b = maxStack.peek(), a > b {
                    count += 1
                }
                minStack.push(a)
            }
        }
    }
    
    print(minStack.array)
}

var minStack = Stack<Int>()
var s = Stack<Int>()

sortStackLong(&minStack)
sortStackShort(&s)
