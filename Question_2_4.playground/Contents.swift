//: Playground - noun: a place where people can play

import UIKit

class Node {
    var value: Int
    var next: Node?
    
    init(value:Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

class Stack: Node {
    
    public func push(){
        
    }
    
    public func pop(){
        
    }
    
    public func peek(){
        
    }
}

let sevenNode = Node(value: 1, next: nil)
let sixNode = Node(value: 2, next: sevenNode)
let fiveNode = Node(value: 10, next: sixNode)
let fourNode = Node(value: 5, next: fiveNode)
let threeNode = Node(value: 8, next: fourNode)
let twoNode = Node(value: 5, next: threeNode)
let oneNode = Node(value: 3, next: twoNode)

func printList(head: Node?){
    if head != nil{
        print(head!.value)
        printList(head:head!.next)
    }
}


func partition(blah: Node?, value: Int) -> Node?{
    var node = blah
    var head = blah
    var tail = blah
    
    while node != nil {
        var next = node?.next
        if (node?.value)! < value {
            node?.next = head
            head = node
        }
        else{
            tail?.next = node
            tail = node
        }
        
        node = next
    }
    
    tail?.next = nil

    return head
}

let a = partition(blah: oneNode, value: 5)
printList(head: a)