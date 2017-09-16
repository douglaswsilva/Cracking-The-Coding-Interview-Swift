//: Playground - noun: a place where people can play

import UIKit

class Node {
    let value: Int
    var next: Node?
    
    init(value:Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

// List One
var twoNode = Node(value: 2, next: nil)
let fiveNode = Node(value: 5, next: twoNode)
let fourNode = Node(value: 4, next: fiveNode)
let threeNode = Node(value: 3, next: fourNode)
twoNode.next = threeNode
let oneNode = Node(value: 1, next: twoNode)

// List Two
let sevenNode = Node(value: 7, next: threeNode)
let sixNode = Node(value: 6, next: sevenNode)

func printList(head: Node?){
    if head != nil{
        print(head!.value)
        printList(head:head!.next)
    }
}

//printList(head: oneNode)
//print()
//printList(head: sixNode)

// Check if there is a loop and where it begins

func isLoop(_ head: Node?) -> Int?{
    var current = head
    var runner = head
    
    while runner != nil {
        
        runner = runner?.next?.next
        current = current?.next
    
        if current === runner {
            return current?.value
        }
        

    }
    
    return nil
}

print(isLoop(oneNode)!)











