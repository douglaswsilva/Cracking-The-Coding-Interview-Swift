//
//  ViewController.swift
//  TestTheCode
//
//  Created by Douglas MacbookPro on 1/27/18.
//  Copyright © 2018 Douglas MacbookPro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var maxStack = Stack<Int>()
    var minStack = Stack<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var mine = MyQueue<String>()
//
//        mine.push("A")
//        mine.push("B")
//        mine.push("C")
//        mine.push("D")
//
//        print("Last Element: ", mine.pop())
        
        maxStack.push(5)
        maxStack.push(2)
        maxStack.push(3)
        maxStack.push(1)
        maxStack.push(4)
        maxStack.push(5)
        maxStack.push(9)
        
        sortStack()
    }
    
    func sortStack() {
        
        var count = 1
        
        while count > 0 {
            
            count = 0
            
            while !minStack.isEmpty {
                if let a = minStack.pop() {
                    maxStack.push(a)
                }
            }
            
            print("Max: ", maxStack)
            
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
            
            print("Min: ", minStack)
            
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
            
            print("Max: ", maxStack)
            
            while !maxStack.isEmpty {
                if let a = maxStack.pop() {
                    if let b = maxStack.peek(), a > b {
                        count += 1
                    }
                    minStack.push(a)
                }
            }
            
            print("Min: ", minStack)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// Queue via stacks: Implement a MyQueue class which implements a queue usign two stacks.

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







