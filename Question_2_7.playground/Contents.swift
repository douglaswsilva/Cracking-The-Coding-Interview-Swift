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
let fiveNode = Node(value: 5, next: nil)
let fourNode = Node(value: 4, next: fiveNode)
let threeNode = Node(value: 3, next: fourNode)
let twoNode = Node(value: 2, next: threeNode)
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

// Check if two lists intersect
func intersect(list1: Node?, list2: Node?) -> Bool {
    var curr1 = list1
    var curr2 = list2
    
    var current: Node?
    
    var length1 = 0
    var length2 = 0
    
    while curr1?.next != nil {
        curr1 = curr1?.next
        length1 += 1
    }
    
    while curr2?.next != nil {
        curr2 = curr2?.next
        length2 += 1
    }
    
//    print("Length")
//    print(length1)
//    print(length2)
    
    if curr1 === curr2 {
        
        curr1 = list1
        curr2 = list2
        
        var interaction = 0
        var count = 0
        var isOne: Bool?
        
        if length1 > length2 {
            current = curr1
            count = length1 - length2
            isOne = true
        } else {
            current = curr2
            count = length2 - length1
            isOne = false
        }
        
        while current != nil {

//            print("1: \(curr1?.value), 2: \(curr2?.value)")
            
            if curr1 === curr2 {
                print(curr1?.value)
                return true
                
            }
            
            if isOne! {
                curr1 = curr1?.next
                
                if interaction >= count{
                    curr2 = curr2?.next
                }
            } else {
                curr2 = curr2?.next
                
                if interaction >= count{
                    curr1 = curr1?.next
                }
            }
            
            current = current?.next
            interaction += 1
        }
    }
    
    return false
}

print(intersect(list1: oneNode, list2: sixNode))










