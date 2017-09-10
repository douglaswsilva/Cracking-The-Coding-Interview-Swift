//: Playground - noun: a place where people can play

import UIKit

class Node {
    let value: String
    var next: Node?
    
    init(value:String, next: Node?) {
        self.value = value
        self.next = next
    }
}

let fiveNode = Node(value: "e", next: nil)
let fourNode = Node(value: "d", next: fiveNode)
let threeNode = Node(value: "c", next: fourNode)
let twoNode = Node(value: "b", next: threeNode)
let oneNode = Node(value: "a", next: twoNode)

func printList(head: Node?){
    if head != nil{
        print(head!.value)
        printList(head:head!.next)
    }
}


func removeNode(head: Node?, value: String) -> Node?{
    var current = head
    var prev: Node?
    
    if (head?.value) == value{
        print("Error: Input another value")
    }
    else{
        while current?.next != nil {
            if (current?.value)! == value {
                prev?.next = current?.next
            }
            else{
                prev = current
            }
            
            current = current?.next
        }
    }
    return head
}

let a = removeNode(head: oneNode, value: "c")
printList(head: a)
