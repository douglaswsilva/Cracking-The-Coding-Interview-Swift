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

let fiveNode = Node(value: 2, next: nil)
let fourNode = Node(value: 4, next: fiveNode)
let threeNode = Node(value: 2, next: fourNode)
let twoNode = Node(value: 2, next: threeNode)
let oneNode = Node(value: 1, next: twoNode)

func printList(head: Node?){
    if head != nil{
        print(head!.value)
        printList(head:head!.next)
    }
}

// Using aditional space

func removeDuplicates(head: Node?) -> Node?{
    var current = head
    var prev: Node?
    var set = Set<Int>()
    
    while current != nil {
        if set.contains(current!.value) == false{
            set.insert(current!.value)
            prev=current
        }
        else{
            prev?.next = current?.next
        }
        
        current = current?.next
    }
    return head
}

// Not using aditional space

func removeDuplicatesInPlace(head: Node?) -> Node?{
    var current = head
    var runner: Node?

    while current != nil {
        runner = current
        while runner?.next != nil {
            if runner?.next?.value == current?.value{
                runner?.next = runner?.next?.next
            }
            else{
                runner = runner?.next
            }
        }
        current = current?.next
    }
    return head
}

let newList = removeDuplicatesInPlace(head: oneNode)
printList(head: newList)

