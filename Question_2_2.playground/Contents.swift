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

let fiveNode = Node(value: 5, next: nil)
let fourNode = Node(value: 4, next: fiveNode)
let threeNode = Node(value: 3, next: fourNode)
let twoNode = Node(value: 2, next: threeNode)
let oneNode = Node(value: 1, next: twoNode)

func printList(head: Node?){
    if head != nil{
        print(head!.value)
        printList(head:head!.next)
    }
}

func kthToLast(head: Node?, kth: Int) -> Int{
    
    var count1 = 0
    var count2 = 0
    var current = head
    
    while current != nil {
        count1 += 1
        current = current?.next
    }
    
    count1 = count1 - kth - 1
    current = head
    
    while count2 < count1{
        current = current?.next
        count2 += 1
    }
    
    return current!.value
}


print(kthToLast(head: oneNode, kth: 4))